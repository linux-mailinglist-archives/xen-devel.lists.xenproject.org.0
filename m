Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E04633481
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 05:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446980.702805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxL5t-0001mG-2Q; Tue, 22 Nov 2022 04:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446980.702805; Tue, 22 Nov 2022 04:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxL5s-0001jD-VP; Tue, 22 Nov 2022 04:41:12 +0000
Received: by outflank-mailman (input) for mailman id 446980;
 Tue, 22 Nov 2022 04:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPg5=3W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxL5s-0001j7-0Y
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 04:41:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0527685-6a1f-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 05:41:09 +0100 (CET)
Received: from AS9P194CA0009.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::19)
 by GV2PR08MB8147.eurprd08.prod.outlook.com (2603:10a6:150:7b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 04:40:57 +0000
Received: from AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::d6) by AS9P194CA0009.outlook.office365.com
 (2603:10a6:20b:46d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Tue, 22 Nov 2022 04:40:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT014.mail.protection.outlook.com (100.127.140.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Tue, 22 Nov 2022 04:40:56 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Tue, 22 Nov 2022 04:40:56 +0000
Received: from 1124bd2dc486.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D7790354-42D5-4961-BDA5-BE0B414FE426.1; 
 Tue, 22 Nov 2022 04:40:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1124bd2dc486.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Nov 2022 04:40:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7762.eurprd08.prod.outlook.com (2603:10a6:10:3ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 04:40:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.013; Tue, 22 Nov 2022
 04:40:48 +0000
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
X-Inumbo-ID: e0527685-6a1f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MndssoRpk1eDjRrPkex3BGiCIwkwRSIyKOb7Fj2wHcc=;
 b=C+/oRY2j9j6WIJFFbm8h9qrNnQmFCLBjP89rAw1W4SU+2WhXgJoKHtkY7x6VedNu3/h0cs9RgInicCdT8CjVogThUaLshPkjPDMpF7pECXmyPhDJG43+LTcOKtLq9QBUYivxSwzfsnt0jFgIpC+7us6sobT0b4YdyfCZ9WaeU68=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX6gAEfbLlAiayEqIF9z0RHItBN/HHoskyAvYB2s0UgA/1zuPMHXONncYzl/UER7xfAvcV2CCFyi6Up/NNAC4PjEidUnz3lAxnjkW1U+Dus9gRYQOLUZAve9Ct5kAFLqajCWaup2of0ZfFfi4Sn+3QhQm51tZfDPzekV9qFZjUWuQEJeUybczKahgYfnQ5LRDmz5aO5nYdLa23NCTOL2t1G3qnp4k6EWrUlM6PDPnCrlnR58TPnLIkPRvTyMLyIYeqyIklhBdmAuAb9sgBaHiJwBiqmYLElYakgfelOrU1tSjfbkgi22ojmFXE/ouX6DNvrpIz1GGdaL3J9bHbaahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MndssoRpk1eDjRrPkex3BGiCIwkwRSIyKOb7Fj2wHcc=;
 b=jKrtuo7TM1QfKvDvXVYp5lPP6+MtBH/tlS/kULspiEc8VwYy07+I9vvmL5hl3l9Sw6bbXHc1DhIAmPunn8x3CBA8z+63rL2HIDgV33PiNTZXLQtMT6yJxJKpPnPmtsPx6XJFtXB8IDGlUZ1fBezUvxhrriZkhRRQqvlGV602Ci1g9m6jaFYq4uzBuWTWnZPW6to0JUZ17fe/tl4UkwVygUEuj3GHAlZkm6UAuOEg7iqULcYcShD+iMIHbFHZT83gREwJ/yXvOMPR1r9ZFtKLZWXAZAK42iYXFNuoT9qaOuPGLUzXcQQScYnvQwBVN/Bjws2nnXFHn/y4m5j/zjlWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MndssoRpk1eDjRrPkex3BGiCIwkwRSIyKOb7Fj2wHcc=;
 b=C+/oRY2j9j6WIJFFbm8h9qrNnQmFCLBjP89rAw1W4SU+2WhXgJoKHtkY7x6VedNu3/h0cs9RgInicCdT8CjVogThUaLshPkjPDMpF7pECXmyPhDJG43+LTcOKtLq9QBUYivxSwzfsnt0jFgIpC+7us6sobT0b4YdyfCZ9WaeU68=
From: Henry Wang <Henry.Wang@arm.com>
To: osstest service owner <osstest-admin@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: RE: [xen-unstable test] 174896: regressions - trouble:
 broken/fail/pass
Thread-Topic: [xen-unstable test] 174896: regressions - trouble:
 broken/fail/pass
Thread-Index: AQHY/il0mnhbZI+0lU6khiE134HQUa5KXDNg
Date: Tue, 22 Nov 2022 04:40:47 +0000
Message-ID:
 <AS8PR08MB79912EE5EF2BA9A0F9527416920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <osstest-174896-mainreport@xen.org>
In-Reply-To: <osstest-174896-mainreport@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A5DDBA7DDF2CEB47AEB531772492C284.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB7762:EE_|AM7EUR03FT014:EE_|GV2PR08MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: b52295b8-d679-49ff-5592-08dacc43bf35
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nQay4RksP3ApgWWYoOKWRFEO/gkAFzgW5EOyIL/t9Ge0BxBHoPAgmuYfluAoX5McixauN0i9dkdRmJhKnZTr++fyA7gCsT1OqbzEcSDkNwVZAkEwKerJDsSogq7kAGmiBXM00SIAiGam+6PgKl30FYbERHl8uKb29HhQpzvna4Aj8KZ4/cNwgtPaw/6zSaabk8CY+RjGAlxU1ey1sh7IHWfp9IyAXBNYzrVCVaWrpVNKrZnHiFN55nBevDbk5/DJqZsH02m51JWSrSbVck7u5OC8c6JSk4Qp8vABfqe3p6yfEJeN+E1WDgtRreY4HwFB8q/YT1miQ1KXFHbgDwYAPjhFTgygimxbgXAT1hbyHGEzE9pPMaHfjw9cedc7zeHmpAz0cCPV1l4PKDuXDB8JE0icupJTjaBRb0mE0QdAvZzQnlRikvLd+WCyj+2RLBbP4aDA+tatja1GU//ojE36Li2RJ17uM7e5JNo60teNsndxVIqqdkuI7pO312DAqXkeJJJyitvRqEIiWrUjAicz7dEwZJfe02CLKtbGVitniNWXOTlsOAHC+j+N0SzAFrY1gVtwNdJ72QOlKG9Uk/3LhbxwRakBEtgkM/dimvl2E1+hlrvDX+JGsYDViafnXOZU0/g5NJGWdsqD60qpoRlG1IYlrFY3j8tNqIAsTkV4U4FKNdgpmrhdq6eR0dLcsblZ6IfX6VyhpEXojIOzVu97n0fnmrpszXhaq411gWQt0km5DJVvaNcw+WdytYQ0aB/2qmtNzn3aKjlEc2w3Jqc30w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199015)(71200400001)(966005)(478600001)(9686003)(76116006)(66946007)(8676002)(66446008)(6506007)(7696005)(64756008)(41300700001)(4326008)(66556008)(66476007)(110136005)(38100700002)(122000001)(186003)(316002)(26005)(54906003)(55016003)(52536014)(2906002)(5660300002)(83380400001)(8936002)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7762
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b53122d6-c356-403e-6858-08dacc43b9c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Amul78SxZAr2XMmjeeWI+HqvrSI45L9hM8DNcich3puowDc4NKIIA/fLNwnLohoe1d0IqG6+1Se2+ZrM9Oh5ioNE90+MLZjaWBFQo/MlydLi9OWF7Q+te0eL5vcDdp7R2MuNgPoUORdCWdpaP9LppaQA/ZWnKZmF8LFtFcwo/RYXXrhhSzKJUCg1X78FG9uewpbE71Ge70uuXVuvbrdcvuXd3Nejkhy0OEjcjWbjCKSblQRmJL67QtHuk1AjiF/s7OGaWhuuvez7246ORgX2AaKe+BXGtboCkrswC+fZVrLZLrZGxXAYzfz95iFKYGV1Gin3pAIzNhkvJVTNNJI4ll+jQUJQ8sOwQaTz9ClUXqg46jF4fNyaUGLkmScYZp3U8SoCAW4i5FDmZXFpf43WcTmiqTnLLkOepyb6wJ3b3SSnpWbYnCPq79qbKbRs6oWtSTsDl+5MUhLx7Fila1XuJ1LiRJAuaWFTpAMM7AQpSpK2u5h/WxjhZKk1GpsjFWjPk5lSVWGwOgfB2k16AJE/JU3Z8/ifn6fYGZQPzbCAKC0BvrrKjmCTu2O2wEdTzLNRTHow1IDg89eKdag6bcx0IqxU0N+vfklKLgy2AZVOzSLaMJA9/uO69EQjnQaINw7d+4Dl9fxttRUkuMqy0a6nyW73zGw/h9/D+3kOEBIYIPw4VPYnx4wF5x+qWwLjcZ+THp1tIhcOzV/MjynCB3OSSTiAFK1kwbEmuKsN8voWf06YoOWPE7x8NuYCO3jspOD8rmAFFT2BlHDmLA9BqtdBcQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(70586007)(47076005)(70206006)(186003)(336012)(40480700001)(26005)(316002)(2906002)(9686003)(6506007)(7696005)(478600001)(966005)(54906003)(86362001)(110136005)(107886003)(40460700003)(41300700001)(82310400005)(356005)(82740400003)(8936002)(55016003)(33656002)(5660300002)(52536014)(83380400001)(8676002)(81166007)(4326008)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 04:40:56.8540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b52295b8-d679-49ff-5592-08dacc43bf35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8147

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFt4ZW4tdW5z
dGFibGUgdGVzdF0gMTc0ODk2OiByZWdyZXNzaW9ucyAtIHRyb3VibGU6IGJyb2tlbi9mYWlsL3Bh
c3MNCj4gDQo+IGZsaWdodCAxNzQ4OTYgeGVuLXVuc3RhYmxlIHJlYWwgW3JlYWxdDQo+IGh0dHA6
Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNzQ4OTYvDQo+IA0K
PiBSZWdyZXNzaW9ucyA6LSgNCj4gDQo+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQg
YXJlIGJsb2NraW5nLA0KPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoN
Cj4gIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dC1kZWJpYW5odm0tYW1kNjQgICAgPGpvYiBzdGF0
dXM+ICAgICAgICAgICAgICAgIGJyb2tlbg0KPiAgdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV0LWRl
Ymlhbmh2bS1hbWQ2NCA1IGhvc3QtaW5zdGFsbCg1KSBicm9rZW4gUkVHUi4NCj4gdnMuIDE3NDc5
Nw0KPiAgdGVzdC1hbWQ2NC1hbWQ2NC1leGFtaW5lLWJpb3MgIDUgaG9zdC1pbnN0YWxsICAgICAg
ICAgIGJyb2tlbiBSRUdSLiB2cy4NCj4gMTc0Nzk3DQo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFl
bXV1LWRlYmlhbmh2bS1pMzg2LXhzbSAxMiBkZWJpYW4taHZtLWluc3RhbGwNCj4gZmFpbCBSRUdS
LiB2cy4gMTc0Nzk3DQoNClNlZWluZyBbMV0gWzJdIGFuZCBbM10sIEkgZ3Vlc3MgdGhlcmUgaXMg
c3RpbGwgc29tZXRoaW5nIHdyb25nIG9yIGl0IGlzIGp1c3QgYW4gT1NTVGVzdCBnbGl0Y2g/DQoN
ClsxXSBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTc0
ODk2L3Rlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWkzODYteHNtL3NhYnJvMS0t
LXZhci1sb2cteGVuLW9zc3Rlc3Qtc2VyaWFsLWRlYmlhbmh2bS5ndWVzdC5vc3N0ZXN0LmxvZw0K
DQpbMl0gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE3
NDg5Ni90ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1pMzg2LXhzbS9zZXJpYWwt
c2Ficm8xLmxvZy4wDQoNClszXSBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9v
c3N0ZXN0L2xvZ3MvMTc0ODk2L3Rlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWkz
ODYteHNtL3NlcmlhbC1zYWJybzEubG9nDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

