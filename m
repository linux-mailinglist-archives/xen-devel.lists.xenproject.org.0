Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C59725422
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 08:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544385.850133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6mdj-0005Q7-F3; Wed, 07 Jun 2023 06:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544385.850133; Wed, 07 Jun 2023 06:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6mdj-0005NH-Br; Wed, 07 Jun 2023 06:27:27 +0000
Received: by outflank-mailman (input) for mailman id 544385;
 Wed, 07 Jun 2023 06:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIn9=B3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q6mdh-0005NB-Tu
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 06:27:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d1922d8-04fc-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 08:27:24 +0200 (CEST)
Received: from FR3P281CA0146.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::18)
 by AS2PR08MB8480.eurprd08.prod.outlook.com (2603:10a6:20b:55e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 06:27:21 +0000
Received: from VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::f0) by FR3P281CA0146.outlook.office365.com
 (2603:10a6:d10:95::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.18 via Frontend
 Transport; Wed, 7 Jun 2023 06:27:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT061.mail.protection.outlook.com (100.127.144.125) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.24 via Frontend Transport; Wed, 7 Jun 2023 06:27:20 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 07 Jun 2023 06:27:19 +0000
Received: from 22b2691b1852.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F4EA8A47-E816-4358-9B48-18E118109622.1; 
 Wed, 07 Jun 2023 06:27:10 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22b2691b1852.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Jun 2023 06:27:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB7679.eurprd08.prod.outlook.com (2603:10a6:150:6f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 06:27:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 06:27:03 +0000
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
X-Inumbo-ID: 5d1922d8-04fc-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2G+YudsYHCqGXXmaP2pV8XtfKK4C3s0h/wdj04WsJE=;
 b=89DO85ghggVeTx1pUt5wK1X+1/hu017nS44DoR+v2XVEK/1lb8DdJ7vWDOFH0aCu6lO3gsWbkXYMR9UhLbnerLCrp8qEi2UFGp6QIHtosBkuafbe6PIzR6n4gwyS3E9CVV1fiRKiVjP8n27C/tI/Ia8QKgF7+IMudgk5wTbfexA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvbKpBAhERA8chTP37j02JaRnE+HKfpTCxVUTHCxO3wXUTPzJGAVdTxn833taU71w/TnOuZQ4afKlmLLqlA8Q6hkv9hDHG3JXhqvdqmO85YtMonfnJ/xHQjV93omrV+AB/vRmfOp0RybTTSQuEgO+tJ4TcZ/Rnr+pYah20dcy7rRprxncwTBKGtMDESzuarNeZxSxXB6gOgYvv+2Wd/pY1gCHw/nnY2PJDuLIE+/+PKsLYQd0HtAfGhbSjs+VmrJcUYWyibMuuRHGuCsyQ8WXjYE+P/IxDgE9K5Ip9LI4X1cj8yxKuvRLvyON1oDzLzeQYCK04WdpE/+Q9NXC/zoBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2G+YudsYHCqGXXmaP2pV8XtfKK4C3s0h/wdj04WsJE=;
 b=nxAPOOBahNr6fox5y7gXql9MibygJZ6qzC+romMHmw1uVluwGI205jVZXhjt1qWupQGxX6FrXGkIs71IEgQR2k8rUp3h1u6qJngrx8VBRU75+oOEiaSVYOqYJ71v17oNoTeNK5BKz2KzSicjoysqQpOMhspAAJHXS5ophiPp7aMu/c0+ckJoS+uDMlQPo9zDwkdnV4t/vMczhtGWgt2ynC8FbQopmhY0cnKdb5jqlZ8ky/j2JEAtssghPFPllDFNWqILmCfeBSGxUAg7dk16mp5No2EVzk4Ibs8So1G16kyiukuyo/WORE3jFbUaagGGkpME7TMk28EceDK7Gon23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2G+YudsYHCqGXXmaP2pV8XtfKK4C3s0h/wdj04WsJE=;
 b=89DO85ghggVeTx1pUt5wK1X+1/hu017nS44DoR+v2XVEK/1lb8DdJ7vWDOFH0aCu6lO3gsWbkXYMR9UhLbnerLCrp8qEi2UFGp6QIHtosBkuafbe6PIzR6n4gwyS3E9CVV1fiRKiVjP8n27C/tI/Ia8QKgF7+IMudgk5wTbfexA=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "jbeulich@suse.com"
	<jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: RE: [XEN][PATCH v7 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Topic: [XEN][PATCH v7 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Index: AQHZlOwR4Ipv6iy3bEahGOYsyZBxb698mYGAgAGnzYCAAKXcgIAAAPGw
Date: Wed, 7 Jun 2023 06:27:03 +0000
Message-ID:
 <AS8PR08MB7991A7A999D07FB0B07559F79253A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-9-vikram.garhwal@amd.com>
 <d6a40e00-e2e3-81d9-b596-45dcfb2becd6@xen.org>
 <007122c9-1ab2-dd5e-bed4-64333113e55a@amd.com>
 <eb266ccb-0621-8de3-1556-638f7f6977f7@amd.com>
In-Reply-To: <eb266ccb-0621-8de3-1556-638f7f6977f7@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 603CD96738F0544FAA05DB7071FA6691.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GVXPR08MB7679:EE_|VI1EUR03FT061:EE_|AS2PR08MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de2936d-c534-47f0-b190-08db67203f85
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Uz9IbtjdCdA1mU+UEoaBKL+gSgyY3LnOue5O/NXjjzZ7gozWhI63K4NodKSjbofVSR6IU13d2jh/pU+q5AW+40Z8zXfJCgZkdJiVVENDxMgsJ7cidEpY9Rjq7mpg/LVXIkV8XP4pgdRCryyU19fRnGDJL9k/Ss0PXlqtgB55+K+Ce2q5nFTx+sEBKS91Lrx49u8hIExX3GDI4osNhFPhvv3ijfhxAFXKv+qAxtmXpgKfBWfHLPTe1gp53jnVBN0AqgSvJ3lT/PrOz617vsY426gB8NJhkAdTGO9yPh6IwCR5Fz7KDcrvcsbIGf4io1mwMKMFVdCc1e4cbFb58cktrJ+fMD+jCNhqgOmCvj9acI4iv/5OffEjVzxNBMCvudBmq/THReSw+gwZEz2lStrHQdKsEeRDre2ZUJhUGJmOA7+WqWE8sHrf5UBCoKq/WODpJztGqNJC2DyZkf4uSJuY6kugsVy9GAEzx9iskxZUxVTUSBsvpCCoG3ElqrElz6/tHFsoKjOhsR+jNG0bVhWme320urgePX0qU6m33rUSog+gshvkmCnsiid402WjzeQ/6wGFeR5UPEyCY3Dlmxs8PlICSDQvSx5jzt+p/HjjEWJWfslNUmRPCrcnLaIA6naQTZ0OOnKKFo861fEm3Xoudw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(9686003)(6506007)(38100700002)(41300700001)(7696005)(186003)(26005)(83380400001)(71200400001)(478600001)(110136005)(4744005)(54906003)(122000001)(66446008)(66556008)(64756008)(66476007)(76116006)(55016003)(66946007)(316002)(2906002)(8676002)(52536014)(8936002)(5660300002)(4326008)(86362001)(38070700005)(33656002)(37363002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7679
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f16ea1ba-59ac-411f-e7c5-08db6720354c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d1ssRwv9BYkupwS2clDM1sI36/gs0H64Hdx7tH1nlKAsUTaqafU52Yu+TsveRt+OpHA32AoX3ogUitvwp4Czx4Iryz82fwwZqCckQsuaDFBq20pePrYQsEuts2XGWKScSOx+TLit7CWcHgNFuQJEd3XM2LdhcApgi406j+lv38Nzuvl1eneob0Rkj7ySZdmHMnUST3Qq+6q1mYtJqblQLE2/JoumssGmidkWOMjnhCC7s9LOZo8ah2oaHD7hn1638mMn3u2LOm2wm9ecgwP/Kt8lFqgmfiHQHcRSIUgKpakjYywvd2mK5z12PzFprEIXeIaReFrJ2okkSMnQ4CBDIjoaS1PCiVjY4m1WCpI+sydUWoZT3ky95DxwnRb3vN3x4jV5eH0rNxnxSzQH0IHEzBGDnQWmcFTVn8STqmAnOWc+mtgLQeTciUuo2JtJHaGw2h2rhkoHji7mEsaFiG12IFSIJuweBgGtZvngV2ouNkLSBvtNFI78oFCgOEN/LiP8dkAHspXZIUDOM9d2VYHr/5MUT/TOrVIN7Cxl2fmHB/8c++hdDfUsVVnn2ls6ZRiL7NW90d2/TVNneROyaKXj1b3JKvo9yKdqjG1Gurn1YZ5/HdSkRLnE4t8pySFl+I0eG32TKlzJNOszEeWvXv72tYZ/cqHLDh4bPkfpLhPDzrn3/yokHg5AZtwWQc/J8dy6553hQtcussroDAYqQ0sqUjpnnJwRR5PV/l1WVOjcdHbP7+AURkKBMUeGxCTbeIF9DaN8z3LnSPMyzP42KNVAhw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(55016003)(40480700001)(54906003)(7696005)(70586007)(110136005)(82740400003)(478600001)(81166007)(316002)(356005)(47076005)(8676002)(8936002)(41300700001)(4326008)(70206006)(186003)(336012)(36860700001)(83380400001)(40460700003)(26005)(6506007)(9686003)(86362001)(52536014)(5660300002)(2906002)(4744005)(33656002)(82310400005)(37363002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 06:27:20.4147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de2936d-c534-47f0-b190-08db67203f85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8480

SGkgVmlrcmFtLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IGlzIHN0YXJ0
aW5nIGZyb20gYSBnaXZlbiBub2RlLiBTbyBob3cgYWJvdXQNCj4gPj4gImR0X2ZpbmRfbm9kZV9i
eV9wYXRoX2Zyb20oKSI/DQo+ID4gVGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4gVGhpcyBu
YW1lIHdhcyBhZGRlZCBpbiB2MyBhcyBMdWNhIEZhbmNlbGx1DQo+ID4gc3VnZ2VzdGVkIHRvIHJl
bmFtZSB0aGlzIGZ1bmN0aW9uIHRvICJkZXZpY2VfdHJlZV9maW5kX25vZGVfYnlfcGF0aCIuIEkN
Cj4gPiBhbSBva2F5IHdpdGggcmVuYW1pbmcgaXQgdG8gZHRfZmluZF9ub2RlX2J5X3BhdGhfZnJv
bSgpLg0KPiA+DQo+ID4gTHVjYSwgTWljaGFsIGFuZCBIZW5yeTogRG9lcyB0aGUgZHRfZmluZF9u
b2RlX2J5X3BhdGhfZnJvbSgpIG5hbWUNCj4gd29ya3MNCj4gPiBmb3IgeW91Pw0KPiBXb3JrcyBm
b3IgbWUuDQoNCisxDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IH5NaWNoYWwNCg0K

