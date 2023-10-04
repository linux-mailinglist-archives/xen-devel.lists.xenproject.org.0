Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD147B7CD6
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 12:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612472.952377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnyn0-0001yP-AR; Wed, 04 Oct 2023 10:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612472.952377; Wed, 04 Oct 2023 10:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnyn0-0001vK-73; Wed, 04 Oct 2023 10:07:34 +0000
Received: by outflank-mailman (input) for mailman id 612472;
 Wed, 04 Oct 2023 10:07:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAsU=FS=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qnymy-0001vE-9G
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 10:07:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d376ca1e-629d-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 12:07:29 +0200 (CEST)
Received: from AM0PR10CA0069.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::22)
 by GV1PR08MB8257.eurprd08.prod.outlook.com (2603:10a6:150:8b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Wed, 4 Oct
 2023 10:07:22 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::a7) by AM0PR10CA0069.outlook.office365.com
 (2603:10a6:208:15::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Wed, 4 Oct 2023 10:07:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Wed, 4 Oct 2023 10:07:21 +0000
Received: ("Tessian outbound fb5c0777b309:v211");
 Wed, 04 Oct 2023 10:07:21 +0000
Received: from c0c8241ea6fc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 73EBF337-74DE-4780-9FFA-13495D890454.1; 
 Wed, 04 Oct 2023 10:06:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0c8241ea6fc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Oct 2023 10:06:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM0PR08MB5329.eurprd08.prod.outlook.com (2603:10a6:208:185::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 10:06:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 10:06:37 +0000
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
X-Inumbo-ID: d376ca1e-629d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSxV9CbDmv/eabP+OzrKRnb/60s/9YtXZ/4MxiNumxY=;
 b=PApj6qObf/ChoLTXbyDqjL0XUo/VQ2syqEDa70nIu+/CXNRMZUy/89y1gKW04JRyarCxWT0nK+8lYzpLs2ILD1964ezL9n7HDcdeijjvPNjN8+S04h1jZBJjcCs4GGh1mRIqLhWPYRvXtn9S2j8iINDkfAV4lTedjgqwitX3D6k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 039f156191ba390f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVvbXRhDfDkHPT5pfpJpcaNP7HO36fUC5hVC6L5o75IH4YSza3QjB0QzolwsrfwusWCz+wKg/QSFkzGt3UXpBYg4x+IXnma0hDWer/32vs6wa7v5sAUQXXHmEleP85lgakl68KtEgUk2wWFNfIpfZcyRFRusu1Fqecr/HQwP7ecxdLvK3aBf07QmB0l7IvhD/9OCIJxXls/VPPpSZaiRYN63I7StlN86bZHUFnxUGJm4WP87uWBFFtTfhLE8tpkL4EHeXcpYtBSL6L19s7VtO2dBMKHpCVrdVvS38DrDe3gnoFwL8CawYKZM/j92ChxuMp2PCuJEi9w+mL2gpj8qAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSxV9CbDmv/eabP+OzrKRnb/60s/9YtXZ/4MxiNumxY=;
 b=YO8Az5bb5Wq8SXMwhrJJVV0DYppHBpgsbTb9wRJ4IuICTVWYz3cNPCdC8BTH8pFzpKQzF3PzsGXyk5zdz724v+GrDhsjV/SCY6nIHQJseUuxuKeq0xSqBKGe4PyFDwYwC0zlVLu6kqLAMEnJpmnLuUPJ3pqvvZogwCBO0cNS4AvKysYI4PXdZh6kRHKTNE+8o3T84DqX4Ab+ZWW1JjO2POc2Qx3bhyVvZ/TxIyqATifkfuI2ov8U/PKgm0dcbmRtfknk/NUBNA5CaLQIlTBLU6a2SlHmPlaf8C7WXz5ymnvUN5Cl6/C1zp4I61SMO6ZmEXIYmA9X6Irk3KDw5/Sv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSxV9CbDmv/eabP+OzrKRnb/60s/9YtXZ/4MxiNumxY=;
 b=PApj6qObf/ChoLTXbyDqjL0XUo/VQ2syqEDa70nIu+/CXNRMZUy/89y1gKW04JRyarCxWT0nK+8lYzpLs2ILD1964ezL9n7HDcdeijjvPNjN8+S04h1jZBJjcCs4GGh1mRIqLhWPYRvXtn9S2j8iINDkfAV4lTedjgqwitX3D6k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Topic: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Index: AQHZ9qj87vFsnMRst0ybMa+ffKOLU7A5Z4mA
Date: Wed, 4 Oct 2023 10:06:34 +0000
Message-ID: <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
References:
 <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
In-Reply-To: <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM0PR08MB5329:EE_|AM7EUR03FT036:EE_|GV1PR08MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: d1615c77-bfc0-44e6-e641-08dbc4c1b315
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3v5YQhVLvODMvHXBB6xxfxEiUbzTzK2Cjlzfd9gSTYZPkUXfq3wLCVBwmKhdU12cZ3mjxPX19U0eUoKuiKBzGMC9szb6dljGJ4y0911KX/nyvqjE/R73ifYr+zxE27g1SnnxLOw6gAEVWR2+An0lrqWTCWl61mCMcDi/tY6jaiUf0Onvi79Gocw0O1r/uTMUShMJYog5gWiiSpzK83Zu1+A3aPcYz56r5703Eg+5ucy32f6S8FtiwtALDVunLN/uHdTpRrHWN8G+tWDLWTUEP0TFNgvFHLFeFGrkC4Sokm/Rm8Aisom1IxKLjfvLX7btdG/9tg6zDlRBTYc+a/oEKIdF/6ndxHG1zyd1v5qkazG9xKinaG9jO9l39sOuZGyUS+uDAxUpYf5EUb8sLld4fSunLVHeHlbBPe+SR4DraDdVyb+WgV55ybZP8M12zJK3+Ncfuklrg2xqVVmyEAtKsoAGqOYPQgpAsaE7N+5VD93aNhDkQQ1CRXr89+WXFXDJ64Fg3T5EB8z9ASYXfyM2PqgtuhR9cxsE729pjK05W7vbFqHXj3DK9MGzDFO77k2LmADqh3m/i7qUg0e0y3JrlCKpYaXvfCHGKeye0DJxboBmKyC2yMtH9FlyNPWwdCB2ewp6A+fnbqqepSPFdnMmAA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(26005)(2616005)(4326008)(6916009)(91956017)(76116006)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(7416002)(2906002)(8936002)(316002)(6666004)(8676002)(6512007)(6506007)(5660300002)(6486002)(41300700001)(53546011)(71200400001)(36756003)(33656002)(86362001)(122000001)(478600001)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <995C723CD8CC1B45AEE69542E30AD623@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5329
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0152ff46-b19e-4433-018b-08dbc4c19704
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lonEkX3nWW730RnYKpI/+CDOi1vsuXmrKNh0b96Tj45ZufQ1C7yEojaKPmkLUXgC5IeeH9jtZjMu5X7z1+NgNmEyNKWu+2LVWKadLAICKPpdZYOAx8iGB3avzD9qzYWPjolI4mnYJCzt9GSqHcKGzqY9mME4HJ9icXqd0qu4qgKtukH5XJiqq1or6gXehQcgjUMAqm+k3uVvQu47QgFzVBUzYEPFMwdqXYpB9T9jl8XyT5kDnIdbPMaxvO3ys8j4za+TNYJVUlnjWcMHyQ8RkJyu7gTRaLhlLQ1M6LxIglzREHU4ctFOOLntQhNIX3808eiYFAV2L5PZ9z/dI18cr6Y2J+G+LlbsCgbd9O7G7nymU0r8razNYqlEzcOr81vW/Y9rOoRoEo6NZV0aCsmdQLZpaW+nnKY7KraqDLZ+paXuT6LDNJ0D+2NOdwTQaOH5f8kh+vnNP8x78Pc9KBHbbTT8/AA6pbBsH2BjUGRKfFX/65/YVXPZfeo3uvk1ZGki8vQ+Ao1NIrOcFb+iaf7jvT9pT4tgFsqjrvdARCB2Q0kkw+43HuAuqLwhfbpjEkrzJW0yBYRlwmaZ21AzH/ZQQ9w+X/N12CPAngOVMKkXWM9zDx7u0ja0R0iJA46yEHKSsmsvGq+VVlpUfaIYQVOwYivqP3lhtlXHAx9wBlSNGQcKgvc3B3854U3PVGkHPUIfAjIJTx/7CkXM/pK6GkBUKNOP3ZnMBFUVOzdzsanuOAeTvxyXCl1vhC44fOdZKYoi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(451199024)(82310400011)(1800799009)(64100799003)(186009)(46966006)(40470700004)(36840700001)(8676002)(8936002)(4326008)(6862004)(5660300002)(2906002)(41300700001)(54906003)(316002)(40460700003)(40480700001)(70206006)(36860700001)(70586007)(6512007)(26005)(53546011)(6506007)(36756003)(6486002)(107886003)(33656002)(2616005)(81166007)(47076005)(356005)(86362001)(336012)(6666004)(478600001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 10:07:21.4721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1615c77-bfc0-44e6-e641-08dbc4c1b315
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8257

SGkgTmljb2xhLA0KDQo+IE9uIDQgT2N0IDIwMjMsIGF0IDEwOjU2LCBhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tIHdyb3RlOg0KPiANCj4gT24gMDMvMTAvMjAyMyA5OjQ2IHBtLCBTdGVmYW5vIFN0
YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBUdWUsIDMgT2N0IDIwMjMsIE5pY29sYSBWZXRyaW5pIHdy
b3RlOg0KPj4gDQo+Pj4gQXMgc3BlY2lmaWVkIGluIHJ1bGVzLnJzdCwgdGhlc2UgY29uc3RhbnRz
IGNhbiBiZSB1c2VkDQo+Pj4gaW4gdGhlIGNvZGUuDQo+Pj4gVGhlaXIgZGV2aWF0aW9uIGlzIG5v
dyBhY2NvbXBsaXNoZWQgYnkgdXNpbmcgYSBTQUYgY29tbWVudCwNCj4+PiByYXRoZXIgdGhhbiBh
biBFQ0xBSVIgY29uZmlndXJhdGlvbi4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGEg
VmV0cmluaSA8bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+DQo+Pj4gDQo+PiAiU0FGIiBkaXNj
dXNzaW9uIGFzaWRlIHRoYXQgY2FuIGJlIHJlc29sdmVkIGVsc2V3aGVyZToNCj4+IA0KPj4gUmV2
aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4g
DQo+IFdlbGwgbm8uICAiU0FGIiBhc2lkZSAoYW5kIFNBRiBkb2VzIG5lZWQgZml4aW5nIGJlZm9y
ZSByZXBvc3RpbmcgdGhpcyBwYXRjaCwgb3RoZXJ3aXNlIGl0J3MganVzdCB1bm5lY2Vzc2FyeSBj
aHVybiksIC4uLg0KPiANCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3Zt
LmggYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uaA0KPj4+IGluZGV4IGQyYTc4MWZjM2ZiNS4u
ZDA2MjNiNzJjY2ZhIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5o
DQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmgNCj4+PiBAQCAtNTcsMTQgKzU3
LDIzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzdm1faW52bHBnYSh1bnNpZ25lZCBsb25nIGxpbmVh
ciwgdWludDMyX3QgYXNpZCkNCj4+PiAjZGVmaW5lIElOU1RSX0lOVDMgSU5TVFJfRU5DKFg4NkVN
VUxfT1BDKCAwLCAweGNjKSwgMCkNCj4+PiAjZGVmaW5lIElOU1RSX0lDRUJQIElOU1RSX0VOQyhY
ODZFTVVMX09QQyggMCwgMHhmMSksIDApDQo+Pj4gI2RlZmluZSBJTlNUUl9ITFQgSU5TVFJfRU5D
KFg4NkVNVUxfT1BDKCAwLCAweGY0KSwgMCkNCj4+PiArLyogU0FGLTItc2FmZSAqLw0KPj4+ICNk
ZWZpbmUgSU5TVFJfWFNFVEJWIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMy
MSkNCj4+PiArLyogU0FGLTItc2FmZSAqLw0KPj4+ICNkZWZpbmUgSU5TVFJfVk1SVU4gSU5TVFJf
RU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDEpLCAwMzMwKQ0KPj4+ICsvKiBTQUYtMi1zYWZlICov
DQo+Pj4gI2RlZmluZSBJTlNUUl9WTUNBTEwgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4
MDEpLCAwMzMxKQ0KPj4+ICsvKiBTQUYtMi1zYWZlICovDQo+Pj4gI2RlZmluZSBJTlNUUl9WTUxP
QUQgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDEpLCAwMzMyKQ0KPj4+ICsvKiBTQUYt
Mi1zYWZlICovDQo+Pj4gI2RlZmluZSBJTlNUUl9WTVNBVkUgSU5TVFJfRU5DKFg4NkVNVUxfT1BD
KDB4MGYsIDB4MDEpLCAwMzMzKQ0KPj4+ICsvKiBTQUYtMi1zYWZlICovDQo+Pj4gI2RlZmluZSBJ
TlNUUl9TVEdJIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMzNCkNCj4+PiAr
LyogU0FGLTItc2FmZSAqLw0KPj4+ICNkZWZpbmUgSU5TVFJfQ0xHSSBJTlNUUl9FTkMoWDg2RU1V
TF9PUEMoMHgwZiwgMHgwMSksIDAzMzUpDQo+Pj4gKy8qIFNBRi0yLXNhZmUgKi8NCj4+PiAjZGVm
aW5lIElOU1RSX0lOVkxQR0EgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDEpLCAwMzM3
KQ0KPj4+ICsvKiBTQUYtMi1zYWZlICovDQo+Pj4gI2RlZmluZSBJTlNUUl9SRFRTQ1AgSU5TVFJf
RU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDEpLCAwMzcxKQ0KPj4+ICNkZWZpbmUgSU5TVFJfSU5W
RCBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwOCksIDApDQo+Pj4gI2RlZmluZSBJTlNU
Ul9XQklOVkQgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4MDkpLCAwKQ0KPiANCj4gLi4u
IHRoaXMgaGFzIGJyb2tlbiBhIHRhYnVsYXRlZCBzdHJ1Y3R1cmUgdG8gaGF2ZSBjb21tZW50cyBh
aGVhZCBvZiBsaW5lcyB3aXRoIG9jdGFsIG51bWJlcnMsIHdoaWxlIC4uLg0KPiANCj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jIGIveGVuL2FyY2gveDg2L2h2
bS9zdm0vZW11bGF0ZS5jDQo+Pj4gaW5kZXggYWEyYzYxYzQzM2IzLi5jNWUzMzQxYzYzMTYgMTAw
NjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jDQo+Pj4gKysrIGIv
eGVuL2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jDQo+Pj4gQEAgLTkwLDkgKzkwLDkgQEAgdW5z
aWduZWQgaW50IHN2bV9nZXRfaW5zbl9sZW4oc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBp
bnN0cl9lbmMpDQo+Pj4gaWYgKCAhaW5zdHJfbW9kcm0gKQ0KPj4+IHJldHVybiBlbXVsX2xlbjsN
Cj4+PiANCj4+PiAtIGlmICggbW9kcm1fbW9kID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDMw
MCkgJiYNCj4+PiAtIChtb2RybV9yZWcgJiA3KSA9PSBNQVNLX0VYVFIoaW5zdHJfbW9kcm0sIDAw
NzApICYmDQo+Pj4gLSAobW9kcm1fcm0gJiA3KSA9PSBNQVNLX0VYVFIoaW5zdHJfbW9kcm0sIDAw
MDcpICkNCj4+PiArIGlmICggbW9kcm1fbW9kID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDMw
MCkgJiYgLyogU0FGLTItc2FmZSAqLw0KPj4+ICsgKG1vZHJtX3JlZyAmIDcpID09IE1BU0tfRVhU
UihpbnN0cl9tb2RybSwgMDA3MCkgJiYgLyogU0FGLTItc2FmZSAqLw0KPj4+ICsgKG1vZHJtX3Jt
ICYgNykgPT0gTUFTS19FWFRSKGluc3RyX21vZHJtLCAwMDA3KSApIC8qIFNBRi0yLXNhZmUgKi8N
Cj4+PiByZXR1cm4gZW11bF9sZW47DQo+Pj4gfQ0KPiANCj4gLi4uIHRoaXMgaGFzIGNvbW1lbnRz
IGF0IHRoZSBlbmQgb2YgbGluZXMgd2l0aCBvY3RhbCBudW1iZXJzLg0KPiANCj4gU28gd2hpY2gg
aXMgaXQ/DQoNCkkgYWdyZWUgd2l0aCBBbmRyZXcgaGVyZSBpbiB0aGlzIHNlbnNlOiB0aGUgaW4t
Y29kZSBjb21tZW50IGlzIHN1cHBvc2VkIHRvIGJlIG9uIHRoZSBsaW5lICpiZWZvcmUqIHRoZSB2
aW9sYXRpb24sDQpub3Qgb24gdGhlIHNhbWUgbGluZSwgc28gSeKAmW0gYWxzbyB3b25kZXJpbmcg
aG93IGl0IGlzIGZpeGluZyB0aGUgdmVyeSBmaXJzdCB2aW9sYXRpb24uDQoNCkNoZWVycywNCkx1
Y2ENCg0KPiANCj4gfkFuZHJldw0KDQo=

