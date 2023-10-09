Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70A7BD4ED
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 10:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614225.955201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qplLR-0001Hk-L8; Mon, 09 Oct 2023 08:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614225.955201; Mon, 09 Oct 2023 08:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qplLR-0001Fl-Dk; Mon, 09 Oct 2023 08:10:29 +0000
Received: by outflank-mailman (input) for mailman id 614225;
 Mon, 09 Oct 2023 08:10:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOJq=FX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qplLP-0001Ff-Jq
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 08:10:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bc80e28-667b-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 10:10:23 +0200 (CEST)
Received: from DUZPR01CA0160.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::20) by DB9PR08MB9947.eurprd08.prod.outlook.com
 (2603:10a6:10:3d1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Mon, 9 Oct
 2023 08:10:05 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bd:cafe::c3) by DUZPR01CA0160.outlook.office365.com
 (2603:10a6:10:4bd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 08:10:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.21 via Frontend Transport; Mon, 9 Oct 2023 08:10:04 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Mon, 09 Oct 2023 08:10:04 +0000
Received: from d9ec9e857713.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30D71BFF-6B22-482B-AB85-D0CD6A7856DB.1; 
 Mon, 09 Oct 2023 08:09:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9ec9e857713.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Oct 2023 08:09:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9488.eurprd08.prod.outlook.com (2603:10a6:10:44f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Mon, 9 Oct
 2023 08:09:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%6]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 08:09:50 +0000
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
X-Inumbo-ID: 4bc80e28-667b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeHYZgPOkRfRU58T+8bb0aPnAZtVyoIphMkF+3yvsjk=;
 b=mBvsWn3apOSDxSOR2WJVk1S8AlOK3mMkNQgluyAOuQWpVCZD2G+AlQKL9fBSwXoOGqA59q2pGNeOUeOaA9BpVlbmZAkSYsABoQW34vdBNGd0OydUNAk2L5CufiB6WZR4Yn+85go/BwpL0oQtk+K3t+3Ws0HyF9sqbsxOrWHHg+8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ca577a799ba393a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFv6P1+fIEsygZ1yST71GGSI6cM9bUvdKbxHvU2w6TQ/5fe+VcYE0dx0IJ3XDGy4ttGmgnauE82rNAsphLYuIAk52RlGWVQ+mFxl8kEPB4TQCQJo28COWfwBjwkxmUAQ5XOKAAZE7tbusO85v+U+VZN71J6d6l0Ah36DtadOHuqIRJKoY4HPpGYm7ebXSpDrXD6diE/h/6Cx6QiEXRM2eif/nDlDoEFg3/MGrxhMUHn7z337U2l+NCNPKk446YKb3q82Us6laR30ARVAiLoBvt+55bWttTdY5B19qM6+7u0ChT7OJlDwslxkanH/h8T216fNfZmInkq9qLO6LvttKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeHYZgPOkRfRU58T+8bb0aPnAZtVyoIphMkF+3yvsjk=;
 b=NmnZYs1nhrCJUuQMl355A2mXfDPsYmKlFOJUwJEJPLVsUNIqWRVjE9BnR0XiHt6qMkedsvAMoe0Dnrqrrd15TegnO7xp8y40J5VoFL0NwabpzpKmQzQZHnNpLnJ/PFPTzl1Cph8jhXldnl9rMrs5SR/YM/B7wPyrlJAqF/klhLGUgBo1Hu1P7Yo6aaKAp/uBVadx9DWbQzGK7JOou90u8f0i6tBpwuoDFsKg4st6aI6AT1X3EIxh/QlFgSs4ilphKYW17aqO/4bxX6xEeLKe4Qtjy3FYH5kXfpxVysH5WB9Cxw/a6ooe+l3KjEXHm0bVA9YBBMT+8wS4DpYRXoyI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeHYZgPOkRfRU58T+8bb0aPnAZtVyoIphMkF+3yvsjk=;
 b=mBvsWn3apOSDxSOR2WJVk1S8AlOK3mMkNQgluyAOuQWpVCZD2G+AlQKL9fBSwXoOGqA59q2pGNeOUeOaA9BpVlbmZAkSYsABoQW34vdBNGd0OydUNAk2L5CufiB6WZR4Yn+85go/BwpL0oQtk+K3t+3Ws0HyF9sqbsxOrWHHg+8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Xen-devel
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
Thread-Index:
 AQHZ9qj87vFsnMRst0ybMa+ffKOLU7A5Z4mAgAAGhgCAAAYzgIAA1KIAgACGqQCAASTEgIAAdASAgAEY6ICAA6FXgA==
Date: Mon, 9 Oct 2023 08:09:49 +0000
Message-ID: <01206405-F295-427C-AA10-3DB191427FE4@arm.com>
References:
 <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
 <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com>
 <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop>
 <C2DDFAB5-D943-4A24-9C14-AF35BE2A7C90@arm.com>
 <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9488:EE_|DBAEUR03FT061:EE_|DB9PR08MB9947:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a6bc9f-6dec-4753-77d2-08dbc89f24eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yt8vcwya7sUnjSSylGu3iW130wcEdDl31QoQfrGhwfFWvrLQeapZ7nxM5UsXiTv49mhhk2VXOJpbAnNm24gUFptJgvmNbB8LY4EQONYNfKJ2d1O/EOLzmEUGfG1XwjwXp1CzzKbuHJ1hvD2c4qipAvhllV1FDLmlhgUh4A1yZ2eVlIb37VusWCMnxx1BoA4XXOmdPxJAvEv9xlHL+Slgu7GwH6Ch10qHSsnGKYqSo9uYN/YGpgv7Hu/IKDBX1gdl1QglxHTBGSB2oLpaThlXfnZoIkbsJ9OoexlzyIUywmQDUKRcs0FNcdUj7KHh3V+Ep3e7pzr6TtR+4e64F8J2RXNc2QCb0Fvje1WdQry0TvcLsLY7BJ3PUOh2URF3vaeHdqm/HrOEU1KLnQKDfBFcoce91pavZCev0Ak48o/Uvtky0Kq7Bcp0XT+UcSxoH5MVjIRZ5TpetXXKd7gUoyZ3OK8RtEiiCj3To8Rn99kBSCAyudfriJhvzjYTkP8hZMVDNntR36oQqt3mwfRMG7KaM3Tp0AmDphAkvK/PMu3BQa74QlgpiPCezeO/asUTsC+/y47+RGEMF6UdS7+S3O8rB9LifhRDiGKMWUHFWDuTuGb7Y9R08tDj38aJ2LZKrXdABO4sPi7AWMrqX0kC5YozLw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(91956017)(66476007)(76116006)(26005)(4326008)(5660300002)(8676002)(66946007)(6916009)(54906003)(8936002)(66556008)(66446008)(6486002)(478600001)(6506007)(64756008)(41300700001)(6512007)(71200400001)(2906002)(7416002)(316002)(2616005)(38070700005)(122000001)(38100700002)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F715F65D1B05724390FF102A0480D644@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9488
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	28e5f1fb-5c15-4c6f-efde-08dbc89f1c1a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KCxii84Pj49cHnbnreGNR+MdBPvvfhT4j1j+6QDHeZj/WntGWD0STN9/6Of0tSTRmpGQGId+ips3b7eHPKfXa9mioLg+s8PZlqRR1OiphBdqQE6U1MT0KVeDrwcVrXaP+W+u9q2f4Eef30okfi+M80/WRbcXX3mnLSMoaS/N3ChsvHHzGJtNu7zCol2jTCaJCpQ3WR8WGyjHUasSt3hMGavvsMhR96/yG02WIvnvHyZBOzsP8CdnjmeBRKBEPwDzQhoYs9ocOu0olGeLmv0lCnuk/jgw3OjM+2X+5OlM759ybQXHaTezAsDx4YL3ooQDtomv1BjXZtP8Ofcrw4MpkLgvQBZ10aZfxU4FiItPUmViNxj3Oe7IWqEtWNoP0v1teKG45nXSHQGXyW0Ycd9zhrLg9t16RrNoYHfNIclH+XJ32QImFC24cJElOpKEp+AXIcupjjkyINUBtrMEqi9nsuqrVJwkmT0AT4M685HgVsho1L7e8LuXxCeIxZqnkjFe1iFgX82XGGANOnxova1RFuXVErU8ZzlPEstTiymkgs8ImZWuSIEvzIDrMgZEvLCJT0j21rTgE1KwjVBvsWA6GNG7uV7QaXHMHCuMa295iUU7E1b4ver76Eg168wpE4qv0jg9QCbSm6mi/OuewooINuj3CD24+ayQFF0XgfdkWWJjoSuTIuLPypTfELeosyEKBcLFxvyxG7r78Kvp+MUj+zg5byvt5+PjhSrIbiDKPJ+s5QCAUpfd50cTfBRiASeZlEUXmmJNl7Zyj0jKAV00TmQcEFUD4SUTqE0tj6PlT48=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(82310400011)(1800799009)(64100799003)(186009)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(336012)(6512007)(33656002)(2616005)(107886003)(86362001)(26005)(81166007)(356005)(36860700001)(36756003)(5660300002)(40480700001)(82740400003)(6486002)(478600001)(47076005)(70586007)(41300700001)(70206006)(6862004)(54906003)(316002)(4326008)(6506007)(8676002)(8936002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 08:10:04.7355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a6bc9f-6dec-4753-77d2-08dbc89f24eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9947

Pj4+IA0KPj4+IFJpZ2h0IHNvIHRoZSByZXN1bHRzIHdvdWxkIGJlIGFsbCBvZmYgYnkgYSBmZXcg
bGluZXMgb2YgY29kZSBzbyB3aGVuDQo+Pj4geW91IGdvIHRvIHJlYWQgdGhlIHJlcG9ydCBnZW5l
cmF0ZWQgYnkgY3BwY2hlY2ssIHRoZSByZWZlcmVuY2VzDQo+Pj4gd291bGRuJ3QgbWF0Y2ggYW55
bW9yZS4NCj4+PiANCj4+PiBCZWZvcmUgZ2l2aW5nIHVwIGFuZCBhY2NlcHRpbmcgdGhhdCB3ZSBh
cmUgY29uc3RyYWluZWQgdG8gb25seSBmb3JtYXRzDQo+Pj4gdGhhdCBkb24ndCBjaGFuZ2UgdGhl
IExPQyBudW1iZXJzLCBjYW4gd2UgY2hlY2sgd2hhdCBDb3Zlcml0eSBzdXBwb3J0cz8NCj4+PiAN
Cj4+PiBJIGFtIGFza2luZyBiZWNhdXNlIHdlIGNvdWxkIGdldCBhd2F5IHdpdGggaW1wbGVtZW50
aW5nIHRoZSBmb3JtYXRzDQo+Pj4gYWJvdmUgaW4gY3BwY2hlY2ssIGdpdmVuIHRoYXQgY3BwY2hl
Y2sgaXMgb3BlbiBzb3VyY2UuIEJ1dCBmb3IgQ292ZXJpdHkNCj4+PiB3ZSBuZWVkIHRvIHN0YXkg
d2l0aCB3aGF0IGlzIGFscmVhZHkgc3VwcG9ydGVkIGJ5IGl0Lg0KPj4+IA0KPj4+IERvZXMgQ292
ZXJpdHkgc3VwcG9ydCBhbnl0aGluZyBvdGhlciB0aGFuOg0KPj4+IA0KPj4+IDx0YWcgb24gcHJl
dmlvdXMgbGluZT4NCj4+PiA8bmV4dCBsaW5lIGlzIGNvZGUgd2l0aCBkZXZpYXRpb24+DQo+PiAN
Cj4+IFVuZm9ydHVuYXRlbHkgbm90LCBmcm9tIGl0cyBkb2N1bWVudGF0aW9uIEkgY2Fu4oCZdCBz
ZWUgYW55dGhpbmcgYXBhcnQgZnJvbSB0aGUgYWJvdmUsDQo+PiBJIGNhbiBhc2sgc29tZW9uZSBm
cm9tIHN5bm9wc3lzIHRob3VnaCB0byBkb3VibGUgY2hlY2suDQo+IA0KPiBJIHdvbmRlciBob3cg
cGVvcGxlIHdvdWxkIGZlZWwgdG8gaGF2ZSBhbiBleGNlcHRpb24gdG8gb3VyIGNvZGluZyBzdHls
ZQ0KPiBpbiB0aGVzZSBjYXNlcyBhbmQgaGF2ZSBsb25nZXIgdGhhbiA4MCBjaGFycyBsaW5lcy4g
SSBhbSBhc2tpbmcgYmVjYXVzZQ0KPiB0aGlzIGlzIGJldHRlciB0aGFuIG1hbnkgb2YgdGhlIG90
aGVyIG9wdGlvbnMgYWJvdmU6DQo+IA0KPiAvKiBTQUYteC1zYWZlICovDQo+IGlmICggbW9kcm1f
bW9kID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDMwMCkgJiYgKG1vZHJtX3JlZyAmIDcpID09
IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDA3MCkgJiYgKG1vZHJtX3JtICYgNykgID09IE1BU0tf
RVhUUihpbnN0cl9tb2RybSwgMDAwNykgKQ0KPiANCj4gQW55IG90aGVyIGlkZWFzPw0KDQpIaSBT
dGVmYW5vLCANCg0KSeKAmXZlIHN1Z2dlc3RlZCBzb21lIG1haWxzIGFnbyB0byB1c2UgI2RlZmlu
ZSBmb3IgdGhlIE1BU0tfRVhUUiBzbyB0aGF0DQpldmVyeSBpbnN0YW5jZSBvZiB0aGUgdmlvbGF0
aW9uIGdvZXMgaW50byBhIGRpZmZlcmVudCBsaW5lLCBidXQgdGhpcyB3b3JrcyBvbmx5DQpJZiBF
Y2xhaXIgaXMgdGhyb3dpbmcgdGhlIHZpb2xhdGlvbiBhdCB0aGUgZGVmaW5pdGlvbiBhbmQgbm90
IGF0IGl0cyB1c2FnZS4NCg0KSSByZW1lbWJlciB3ZSBoYWQgYSBkaXNjdXNzaW9uIG1vbnRocyBh
Z28gYWJvdXQgdGhhdCBidXQgSSBkb27igJl0IHJlbWVtYmVyDQpJZiBSb2JlcnRvIHRvbGQgdXMg
dGhhdCB0aGlzIGJlaGF2aW91ciBjYW4gYmUgYWRqdXN0ZWQgaW4gRWNsYWlyIG9yIG5vdC4NCg0K
QW4gZXhjZXB0aW9uIGluIHRoZSBjb2Rpbmcgc3R5bGUgd291bGQgbWFrZSB0aGUgYWRvcHRpb24g
b2YgYW4gYXV0b21hdGljIHRvb2wNCmRpZmZpY3VsdC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

