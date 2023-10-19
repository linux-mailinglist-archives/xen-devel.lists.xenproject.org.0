Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED277CF6E0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619239.964012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRG0-0004Sh-Ec; Thu, 19 Oct 2023 11:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619239.964012; Thu, 19 Oct 2023 11:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRG0-0004Qc-Bi; Thu, 19 Oct 2023 11:32:04 +0000
Received: by outflank-mailman (input) for mailman id 619239;
 Thu, 19 Oct 2023 11:32:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWKy=GB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtRFy-0003kc-NF
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:32:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f48dad2-6e73-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 13:32:02 +0200 (CEST)
Received: from DB7PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:10:52::23)
 by DU0PR08MB9132.eurprd08.prod.outlook.com (2603:10a6:10:474::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 11:31:29 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::52) by DB7PR02CA0010.outlook.office365.com
 (2603:10a6:10:52::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25 via Frontend
 Transport; Thu, 19 Oct 2023 11:31:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 11:31:28 +0000
Received: ("Tessian outbound 470906b1fe6c:v215");
 Thu, 19 Oct 2023 11:31:28 +0000
Received: from 0f82464f40e5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44141C31-7F06-438E-B953-57048A8E19FD.1; 
 Thu, 19 Oct 2023 11:31:22 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f82464f40e5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Oct 2023 11:31:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6243.eurprd08.prod.outlook.com (2603:10a6:20b:2db::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Thu, 19 Oct
 2023 11:31:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:31:20 +0000
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
X-Inumbo-ID: 1f48dad2-6e73-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zCI9rSwaIYbX2/GzIn7SKRGYyk5emz9bZ9KcDhCDUk=;
 b=dprafdRHS/NiZ0h1w8ELOS6vUePVY47rW9PBq+SAVIIlfi/ZlxkRYsokpYfEKPQYpRQI5FKxGrXszzo2Pl9QHIxZF2TR6tJhY3AQzqeY6mvDPDtfSc+W3a+wAA9Q8T9JI0UEluwdVPA5ggZ3RnYCbADXhy7FPrq4XdsPia3NPRI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa05c62ad8cc3cb9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixPBkNoIiw1wKy7xwDjkTySBiju5LWipDsh+rwa0C5sQCHDGO5CBLxMdRYxB3NNCsq3jD8HVU/BNaS9clKA+Bzh4BjRs+GImTOLJyQ1vpV569OJrvO973/HtwMWjvPn5arqBREQPWz8Pp4qH5O72/NSrQWbtEauykf1qH+ynwlkAHSQO30moei+Dfdr8M+YmMkN02Zf3PteGrItOOiEyPyc3hFcgZWwbolsf8r6ib4DiGX0soBB1nBj9JAhy+SSGNfeyi2DcPH9WSNYgmSanfvHE61fTzd3tSEOQGA2QZkZsA0OTt7TFVJFYV/kh3/8Jc2JhnOjTbV3opH/m3YDaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zCI9rSwaIYbX2/GzIn7SKRGYyk5emz9bZ9KcDhCDUk=;
 b=Eu0zpxqCdHieyr1b2y6wKBJ2VXCsEjpncyGJBJI0RYuVFmzuz43kFsPfF7qbP8tbq3rNZSx3A0PejT6LCpsJqcpHLVzLpsGypTj5aEsIPeNU93ep69Sn7ORXjJAs6Elj7ImDZVHetuhvTD1tW7ksYb+AwsYdF3tkhMIl5c7eJi512NSjEr5jkpqvbiFHWGFQco4pN+6asz722+pM1S5P0a2dK7drsEc3x7QXTcqhp4JF1MzP+cJQ1f2Fpc34jXOP5k+x/v2CkuIZuGAAUCtSYkT6kZazN3YXmv4QBmDb+KOIyw3QZAT/QRrKEWM5ZT93BOA9ENA7X0EL0NpY2qeV4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zCI9rSwaIYbX2/GzIn7SKRGYyk5emz9bZ9KcDhCDUk=;
 b=dprafdRHS/NiZ0h1w8ELOS6vUePVY47rW9PBq+SAVIIlfi/ZlxkRYsokpYfEKPQYpRQI5FKxGrXszzo2Pl9QHIxZF2TR6tJhY3AQzqeY6mvDPDtfSc+W3a+wAA9Q8T9JI0UEluwdVPA5ggZ3RnYCbADXhy7FPrq4XdsPia3NPRI=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.18] iommu: fix quarantine mode command line
 documentation
Thread-Topic: [PATCH for-4.18] iommu: fix quarantine mode command line
 documentation
Thread-Index: AQHaAnmVbDgQExfU5k2xqQmtvlQ2ELBQ7zKAgAALXgA=
Date: Thu, 19 Oct 2023 11:31:20 +0000
Message-ID: <8AFAA72C-4676-48EB-AFC3-041A070CA67B@arm.com>
References: <20231019104551.27870-1-roger.pau@citrix.com>
 <803d5f10-edf4-9e10-f801-d480c93ebec8@suse.com>
In-Reply-To: <803d5f10-edf4-9e10-f801-d480c93ebec8@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB6243:EE_|DB5PEPF00014B9C:EE_|DU0PR08MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: be06f420-4463-46c7-a3cb-08dbd096efb7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RblHIT1A1cjVlch0e5uibYG1zoYlaQ4CC1Qn6cdTI6Dro05jqP34Pw/vrqd6SGAoEPZrs8phCXDz/pCjiVe4DbDKzSCAHmMyoyYV6F4FNkYRVNOrtV+K4Yk3FdYB3k2yLlP4v+weecdH0WyxFtOakJveIpcRZQ/mNpSOysQ8ujcUEOLGF2y3yj99vp4HJEoFz9VCBugW+WyXMYFXkvTSdRO/FuWEQp5Jzq3bXGJ0SvsZblXAU8s5OhyLrB1plpKfuUrP0Oi/0IjDhmdPnShuaJOrgzeLG4NEqBCExYG2w5bRimRB+vHLQo/3auv6DRDPi1o2zusTyMeYrT0WH6fJP+LpkGZ4J6xc1AymZltP/2WHNddfF+0IN4BPM9oyNh3NPCXd89mM6uWoVfoZggH1L8GQRFkAvF6lFPgXmJ+7hf7xrvmbS8Aj7bPu0Jh1Sn16R8DNUSo6yiX7I2LJmcU18SjFK5Hi8iYa0e6qYzSnlDH5GB96/zoXyuRYELh7E8LU9bx4X75r/m+vwsth0uFK+e3ShOkPOH9HXkHyF6+G+E4OZsR9+QMHHwtr3xD6nUeZiu1u5oA93pysjSpvw1U50DPAzzW1XO+tlo9GhCq2Ayc0NFUSAwiWSx9XHVo13IiDgN+ji7KuNR+dRnf6zg4+tA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(4744005)(33656002)(26005)(5660300002)(4326008)(8936002)(8676002)(36756003)(41300700001)(54906003)(316002)(64756008)(66446008)(66476007)(66556008)(91956017)(110136005)(86362001)(66946007)(478600001)(6486002)(71200400001)(76116006)(53546011)(6512007)(6506007)(2616005)(38100700002)(38070700005)(83380400001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0C3AB4461E88A459AB5AF217CF01619@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6243
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	923f4398-5edd-4042-a53f-08dbd096eb06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h/ysxeI2/vQkSfHJ9FJiAI+OQc+sTexuH1wYMs2lIrV3TJg9CYH8TF8gs+QtpSBEY1DtFE7tVBHwGNLB5SL83rnwZXTIesZa9YNV5iLS77GZe/a0m2sfuwC9COxaStNuvkHTg8GEREUJgfD/d7DkgNIWj/hPTK9ekPl6ZPEZKRcF2X2c41FV4POVAk5y65tQ+zCeqd0lhddWKeXo+ShS03o4LArlG1KO1V8A09JHwT0zuYUtJp/lF9zU66QydEEUY19OW/mrkrH68Wdx4LCeAiBuhUubi09+d4IDlgTK4TV70SaQfzrA05fny6BRhbZFdDumY8HkIrPRD+VWYvl82DtkDQee/+PmZ7spfvsP9/C9AmB3lGTD46BdREt5sau7XOv/PXoDHbzw26LY/um07w5J3tJ6wrSAJWXJV1gYnJDiudAMOLhxkLN46raE1LQi4lV6Xdi+5FAI6p77bVpqeahxWtz86cp+dJrIkxtezftWTBrhohzDw6fY/Pqel/IohzBBkXVpVAQhIhM+6HLvYSE6So7P4q1Jyur+BFzeo3uk+2Q0WLZGGzXrHDmOatnFXsfBeTQ3rhsxyt6IUV2a58z5IeQsCPHQAh9kFJc1CQaGFDPY5jltbxG4dQrQu6I6A1Bt+P66D3GJhl83m8AYLBBFxDJj+ub5593OlhQphc+UUuZytWRpRK8x2eeI2/tzIHrb9AnEgNjGcLrycvEYs13dOwjKH615iCbg94JIZsXRcM8CmJv7quS+wEXAgifXYFSIjpGCnMMyjnL7lgiuGJhosInzPIvwLHH/RC1k9Fg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799009)(36840700001)(46966006)(40470700004)(83380400001)(26005)(336012)(2616005)(2906002)(4744005)(5660300002)(8676002)(8936002)(4326008)(40460700003)(36756003)(33656002)(86362001)(356005)(81166007)(40480700001)(82740400003)(36860700001)(47076005)(6506007)(6512007)(6486002)(53546011)(110136005)(70586007)(41300700001)(316002)(70206006)(54906003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:31:28.8206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be06f420-4463-46c7-a3cb-08dbd096efb7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9132

SGkgSmFuLCBSb2dlciwNCg0KPiBPbiBPY3QgMTksIDIwMjMsIGF0IDE4OjUwLCBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTkuMTAuMjAyMyAxMjo0NSwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4gV2l0aCB0aGUgYWRkaXRpb24gb2YgcGVyLWRldmlj
ZSBxdWFyYW50aW5lIHBhZ2UgdGFibGVzIHRoZSBzaW5rIHBhZ2UgaXMgbm93DQo+PiBleGNsdXNp
dmUgZm9yIGVhY2ggZGV2aWNlLCBhbmQgdGh1cyB3cml0YWJsZS4gIFVwZGF0ZSB0aGUgZG9jdW1l
bnRhdGlvbiB0bw0KPj4gcmVmbGVjdCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbi4NCj4+IA0K
Pj4gRml4ZXM6IDE0ZGQyNDFhYWQ4YSAoJ0lPTU1VL3g4NjogdXNlIHBlci1kZXZpY2UgcGFnZSB0
YWJsZXMgZm9yIHF1YXJhbnRpbmluZycpDQo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhl
bnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0K

