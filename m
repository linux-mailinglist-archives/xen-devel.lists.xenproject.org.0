Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CEA6F4689
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 16:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528699.822178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrT6-00074j-Ng; Tue, 02 May 2023 14:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528699.822178; Tue, 02 May 2023 14:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrT6-000733-Ja; Tue, 02 May 2023 14:59:04 +0000
Received: by outflank-mailman (input) for mailman id 528699;
 Tue, 02 May 2023 14:59:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbmr=AX=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1ptrT4-00072t-Ul
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 14:59:03 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060.outbound.protection.outlook.com [40.107.247.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd31d87a-e8f9-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 16:58:57 +0200 (CEST)
Received: from DB8PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:10:110::36)
 by AS8PR08MB7815.eurprd08.prod.outlook.com (2603:10a6:20b:529::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 14:58:50 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::e0) by DB8PR04CA0026.outlook.office365.com
 (2603:10a6:10:110::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 14:58:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.19 via Frontend Transport; Tue, 2 May 2023 14:58:49 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Tue, 02 May 2023 14:58:49 +0000
Received: from d9863d2e0def.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C45C26F2-BA9F-4E86-83E4-71C0489797EC.1; 
 Tue, 02 May 2023 14:58:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9863d2e0def.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 May 2023 14:58:42 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS8PR08MB9791.eurprd08.prod.outlook.com (2603:10a6:20b:614::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 14:58:41 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb%7]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 14:58:40 +0000
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
X-Inumbo-ID: dd31d87a-e8f9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoBq4X/ytiUZ+0l51aI3Y1BdDXoWW4utuLAfOzMoDMw=;
 b=CGedJUB5Dw3X8EqHxpm4JSFSuD/JBi60rl8xHgJc4whKjfhvWz7JVNuvxVu9MNQc9gKjhC1He/Lb6rAXEWMO68T4NezCVYf9oSFD4QTfkZMcBhnpxXpQQ0OvJSLS5lbxkNc4q0drTmdrykTwjyI7kxoI97aSUQ5Oh7mkWKOc3aU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9e3d369f3555d3d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuUoe9q251JAtDGbWBbhaJBZwGnv944m4b9/uZVKpYsHav2Or71oZ/yofCAQAY/0fr2xj891FUraR+tJxpng3igcGyl/omy3Ec127mYpZI3na+5E4qAmVJvuBsoaklDjTzmsfbHFYxukVb3U4hNsS/puVgVOnBJl2dP1BPq25y/zlDwoSWKCGvBvGq4kEX3/soEsRucVcFusnJ2pFry5kUxlyPeeTGJ5DUg/PKGKNk1k5GZC/PGVYvVnCfEcRaP6KL/ySp8UoMMvkRzhLTtO1DKVOsLsJjdIatDOW+hjZ0+bpyrlHDaSvS1M6vLwiuMYeJUGt5mLU26FndO2BetdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoBq4X/ytiUZ+0l51aI3Y1BdDXoWW4utuLAfOzMoDMw=;
 b=LdACtd0pPu6GFRfjr4IlN8OKcYNZIsHIHVhFlzxhxZfUemFo67RfFDuNlsqtaKWD5jcW5ljAiozBh7flCU5alUTWuceme9B582qBSDtFW5kAU8Gvfr0vfchwv3AvBzBAgFVHzDyGvfI9ewG+nDldEaKQPo0rC722txa0xgwShy1mBwFM0ZqArS0HCVRPzXPTEZvreYmtvUe/aj6vKBzFypSLNioWwXci4Q1PL3XHWVxRTQldaA101H2edM+uVWiTzlIWlIKbysiDp9AXAQQgz82VbQ5VrrR2hVO/TYw4wPh2J+brYbYwy1CYJm2/s8GGuzecX0qRuqWr9CWPg9trsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoBq4X/ytiUZ+0l51aI3Y1BdDXoWW4utuLAfOzMoDMw=;
 b=CGedJUB5Dw3X8EqHxpm4JSFSuD/JBi60rl8xHgJc4whKjfhvWz7JVNuvxVu9MNQc9gKjhC1He/Lb6rAXEWMO68T4NezCVYf9oSFD4QTfkZMcBhnpxXpQQ0OvJSLS5lbxkNc4q0drTmdrykTwjyI7kxoI97aSUQ5Oh7mkWKOc3aU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Samuel Holland
	<samuel@sholland.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Marc
 Zyngier <maz@kernel.org>, Jane Malalane <jane.malalane@citrix.com>, David
 Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH] xen/evtchn: Introduce new IOCTL to bind static evtchn
Thread-Topic: [PATCH] xen/evtchn: Introduce new IOCTL to bind static evtchn
Thread-Index: AQHZec44jeWWxzG+E02fa4Z9QZ57Yq9At36AgAZiAgA=
Date: Tue, 2 May 2023 14:58:40 +0000
Message-ID: <116F2F64-6262-4DE3-B9AD-ADE21BD54E41@arm.com>
References:
 <48d30a439e37f6917b9a667289792c2b3f548d6d.1682685294.git.rahul.singh@arm.com>
 <a3a0dba5-a231-7cc2-dbad-79df7ad9a136@amd.com>
In-Reply-To: <a3a0dba5-a231-7cc2-dbad-79df7ad9a136@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AS8PR08MB9791:EE_|DBAEUR03FT060:EE_|AS8PR08MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c28ac84-2555-449d-a3d8-08db4b1dbcf3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jCSUpN1muS3VQGud2LvUjavYy486L/5e7a7Zk5n6IfmdwKUl/3J696gaflL6/T+AxjGlrYwDlmNIgMKZAGHRBocS435Z/f1x+hFBEdNpea9dU0axn6bdPZc3pIzcuUMjsvIwQlGMAxH2+efs6BUHMAPxV/OteeCYPLPSYbMEqVNLtv+A6g/vUh6UadpRu4gezw6qmu9xSmtd2eA1lpmGPkw4cT/Nf1HVrlY+H2asCLx0CixnMlx6YPWaOs/NkM/Y4f6DwJYBC1ay6xCIo9yijQqntlXYmljKgXYC4yMQzS5FwEUP4xERN11t2b1VU5aUcwEwN+wPF3KMthwUoxyz44+sYiFl7r8QC4VK7h9jMiue4dReIAHFap5nRcEHbqKXXfNjeICLaEb+Ny62XPr3cSDbskFlGGZW1owfn48AWN+CTyJOV4SZr+GBk28kKUwc66KlpP5GrbypZVcYhaAgQDGgKTtktR2aT8EHN3SEflk2+aSNHpzYTfuN7V+lOT0EOrnYnDnb0e/iqu44XpHD6u5Pnrf0eshdq8qxGd70W8S3c0Dv/KGCwggsSdncBPom07O9BlVjJF/qRzAkq8MlK9iMAiPceTvQUGAn8S5EiLWHHeC02Abzxaal5FMBpfiJKW7A4osiHpurPyr20w4VhA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(54906003)(2616005)(83380400001)(478600001)(53546011)(6486002)(6512007)(26005)(6506007)(71200400001)(66946007)(6916009)(316002)(4326008)(66476007)(66446008)(64756008)(91956017)(186003)(66556008)(76116006)(38070700005)(122000001)(41300700001)(8936002)(5660300002)(7416002)(8676002)(38100700002)(2906002)(33656002)(86362001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_116F2F6462624DE3B9ADADE21BD54E41armcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9791
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	33f16859-7e54-42f2-3bf8-08db4b1db775
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	13LNVI5gDYd1TAi7qtXvttmJuVqjU2OE0IrohF0stePDTXU+L5bu9yvWDb+Ya0oSnNDnMwDItDHwstj+4FD51vqF/vmofqUzaqLlIamn9nwwROWU/SgRApVeyC2DwjuL9CX5opx30OuGwdyjQFAApVVmsUeauSfU6EFLAiatPwd7apZh8AlQfqLZhzjTAvPGzecWsSx2CjJG0G0roBkAzIf9wrQoZJ84BLT3PQzpgEaczLZmQ90uKJrAxDHm9PQSOuUbQ62LzWIqM5wt4bp4WogSHDYmbUDiV70X3B9F52lLkTglZiGduOohKip1MI998aaFZBZcVxO4kx7DOB+jtsYqgnsECHQ1lAD7Rr6go1FVfeUGagALw4lJ2Vw7E6N8LIs3nxVfJRla1OqH2Jp7jG/IFCGZDn75XyOehYui3Vp7cRiOpQk7TR6IeIXvSOTYomK1037pJBltk411VqVgiftchadsfbuMkgS6LefghK1VeehkyIwB8w5RvW20sbxquA6qCI/HxGQ8KZ7tS0bw0DGTj/T0pT3iqrNlL6oECLvbW8aO6phluQ5xPWqAf4JEcvYLGZH+ZVQb2mpZoJ/lj44A7LN7rIFYLDf3smxJmr+Y9K7pAGigswZdlsEmzcclX+NtmPVdAuvIRZYWEkwHFPcxwf1I79lqe3FOdmg/ii1vPUDxgJSFB4uYUhiyHVd5+QDEOgFe1wT3HNKeNbptnWPdMLMK4Kr6733oWq7hmjY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(5660300002)(40480700001)(40460700003)(86362001)(8936002)(8676002)(6862004)(4326008)(82740400003)(41300700001)(70206006)(70586007)(81166007)(316002)(356005)(2906002)(107886003)(53546011)(26005)(6506007)(6512007)(34020700004)(6486002)(186003)(33964004)(336012)(36860700001)(83380400001)(47076005)(36756003)(33656002)(82310400005)(2616005)(54906003)(478600001)(45080400002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 14:58:49.9119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c28ac84-2555-449d-a3d8-08db4b1dbcf3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7815

--_000_116F2F6462624DE3B9ADADE21BD54E41armcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

IEhpIEF5YW4sDQoNCk9uIDI4IEFwciAyMDIzLCBhdCAyOjMwIHBtLCBBeWFuIEt1bWFyIEhhbGRl
ciA8YXlhbmt1bWFAYW1kLmNvbT4gd3JvdGU6DQoNCkhpIFJhaHVsLA0KDQpPbiAyOC8wNC8yMDIz
IDEzOjM2LCBSYWh1bCBTaW5naCB3cm90ZToNCkNBVVRJT046IFRoaXMgbWVzc2FnZSBoYXMgb3Jp
Z2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVzZSBwcm9wZXIganVkZ21l
bnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywg
b3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KDQoNClhlbiA0LjE3IHN1cHBvcnRzIHRoZSBj
cmVhdGlvbiBvZiBzdGF0aWMgZXZ0Y2hucy4gVG8gYWxsb3cgdXNlciBzcGFjZQ0KYXBwbGljYXRp
b24gdG8gYmluZCBzdGF0aWMgZXZ0Y2hucyBpbnRyb2R1Y2UgbmV3IGlvY3RsDQoiSU9DVExfRVZU
Q0hOX0JJTkRfU1RBVElDIi4gRXhpc3RpbmcgSU9DVEwgZG9pbmcgbW9yZSB0aGFuIGJpbmRpbmcN
CnRoYXTigJlzIHdoeSB3ZSBuZWVkIHRvIGludHJvZHVjZSB0aGUgbmV3IElPQ1RMIHRvIG9ubHkg
YmluZCB0aGUgc3RhdGljDQpldmVudCBjaGFubmVscy4NCg0KQWxzbywgc3RhdGljIGV2dGNobnMg
dG8gYmUgYXZhaWxhYmxlIGZvciB1c2UgZHVyaW5nIHRoZSBsaWZldGltZSBvZiB0aGUNCmd1ZXN0
LiBXaGVuIHRoZSBhcHBsaWNhdGlvbiBleGl0cywgX191bmJpbmRfZnJvbV9pcnEoKSBlbmQgdXAN
CmJlaW5nIGNhbGxlZCBmcm9tIHJlbGVhc2UoKSBmb3AgYmVjYXVzZSBvZiB0aGF0IHN0YXRpYyBl
dnRjaG5zIGFyZQ0KZ2V0dGluZyBjbG9zZWQuIFRvIGF2b2lkIGNsb3NpbmcgdGhlIHN0YXRpYyBl
dmVudCBjaGFubmVsLCBhZGQgdGhlIG5ldw0KYm9vbCB2YXJpYWJsZSAiaXNfc3RhdGljIiBpbiAi
c3RydWN0IGlycV9pbmZvIiB0byBtYXJrIHRoZSBldmVudCBjaGFubmVsDQpzdGF0aWMgd2hlbiBj
cmVhdGluZyB0aGUgZXZlbnQgY2hhbm5lbCB0byBhdm9pZCBjbG9zaW5nIHRoZSBzdGF0aWMNCmV2
dGNobi4NCg0KU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+
DQotLS0NCiBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8ICA3ICsrKysrLS0NCiBk
cml2ZXJzL3hlbi9ldnRjaG4uYyAgICAgICAgICAgICB8IDIyICsrKysrKysrKysrKysrKysrLS0t
LS0NCiBpbmNsdWRlL3VhcGkveGVuL2V2dGNobi5oICAgICAgICB8ICA5ICsrKysrKysrKw0KIGlu
Y2x1ZGUveGVuL2V2ZW50cy5oICAgICAgICAgICAgIHwgIDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQs
IDMyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFz
ZS5jDQppbmRleCBjNzcxNWY4YmQ0NTIuLjMxZjJkMzYzNGFkNSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jDQorKysgYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZl
bnRzX2Jhc2UuYw0KQEAgLTExMiw2ICsxMTIsNyBAQCBzdHJ1Y3QgaXJxX2luZm8gew0KICAgICAg
ICB1bnNpZ25lZCBpbnQgaXJxX2Vwb2NoOyAvKiBJZiBlb2lfY3B1IHZhbGlkOiBpcnFfZXBvY2gg
b2YgZXZlbnQgKi8NCiAgICAgICAgdTY0IGVvaV90aW1lOyAgICAgICAgICAgLyogVGltZSBpbiBq
aWZmaWVzIHdoZW4gdG8gRU9JLiAqLw0KICAgICAgICByYXdfc3BpbmxvY2tfdCBsb2NrOw0KKyAg
ICAgICB1OCBpc19zdGF0aWM7ICAgICAgICAgICAvKiBJcyBldmVudCBjaGFubmVsIHN0YXRpYyAq
Lw0KDQpJIHRoaW5rIHdlIHNob3VsZCBhdm9pZCB1OC91MTYvdTMyIGFuZCBpbnN0ZWFkIHVzZSB1
aW50OF90L3VpbnQxNl90L3VpbnQzMl90Lg0KDQpIb3dldmVyIGluIHRoaXMgY2FzZSwgeW91IGNh
biB1c2UgYm9vbC4NCg0KTWFrZSBzZW5zZS4gSSB3aWxsIGNoYW5nZSB0byBib29sIGluIG5leHQg
cGF0Y2guDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo=

--_000_116F2F6462624DE3B9ADADE21BD54E41armcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2BFC176F7B3B424D9CEA0E18D6C59CC0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJvdmVyZmxv
dy13cmFwOiBicmVhay13b3JkOyAtd2Via2l0LW5ic3AtbW9kZTogc3BhY2U7IGxpbmUtYnJlYWs6
IGFmdGVyLXdoaXRlLXNwYWNlOyI+DQombmJzcDtIaSBBeWFuLDxicj4NCjxkaXY+PGJyPg0KPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSI+DQo8ZGl2Pk9uIDI4IEFwciAyMDIzLCBhdCAyOjMwIHBtLCBB
eWFuIEt1bWFyIEhhbGRlciAmbHQ7YXlhbmt1bWFAYW1kLmNvbSZndDsgd3JvdGU6PC9kaXY+DQo8
YnIgY2xhc3M9IkFwcGxlLWludGVyY2hhbmdlLW5ld2xpbmUiPg0KPGRpdj48c3BhbiBzdHlsZT0i
Y2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1z
aXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7
IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0
YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6
IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBw
eDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyBmbG9hdDogbm9uZTsgZGlzcGxheTogaW5saW5lICFp
bXBvcnRhbnQ7Ij5IaQ0KIFJhaHVsLDwvc3Bhbj48YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2Io
MCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1z
dHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAw
OyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6
IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3Bh
Y2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlv
bjogbm9uZTsiPg0KPGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZh
bWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9u
dC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6
IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNm
b3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtp
dC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7Ij4NCjxzcGFu
IHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNh
OyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6
IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1h
bGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0
ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13
aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBp
bmxpbmUgIWltcG9ydGFudDsiPk9uDQogMjgvMDQvMjAyMyAxMzozNiwgUmFodWwgU2luZ2ggd3Jv
dGU6PC9zcGFuPjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1p
bHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQt
dmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBu
b3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9y
bTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQt
dGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyI+DQo8YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0iZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXpl
OiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZv
bnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IGF1dG87IHRl
eHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsg
d2hpdGUtc3BhY2U6IG5vcm1hbDsgd2lkb3dzOiBhdXRvOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdl
YmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7Ij4NCkNB
VVRJT046IFRoaXMgbWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJj
ZS4gUGxlYXNlIHVzZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0
dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLjxi
cj4NCjxicj4NCjxicj4NClhlbiA0LjE3IHN1cHBvcnRzIHRoZSBjcmVhdGlvbiBvZiBzdGF0aWMg
ZXZ0Y2hucy4gVG8gYWxsb3cgdXNlciBzcGFjZTxicj4NCmFwcGxpY2F0aW9uIHRvIGJpbmQgc3Rh
dGljIGV2dGNobnMgaW50cm9kdWNlIG5ldyBpb2N0bDxicj4NCiZxdW90O0lPQ1RMX0VWVENITl9C
SU5EX1NUQVRJQyZxdW90Oy4gRXhpc3RpbmcgSU9DVEwgZG9pbmcgbW9yZSB0aGFuIGJpbmRpbmc8
YnI+DQp0aGF04oCZcyB3aHkgd2UgbmVlZCB0byBpbnRyb2R1Y2UgdGhlIG5ldyBJT0NUTCB0byBv
bmx5IGJpbmQgdGhlIHN0YXRpYzxicj4NCmV2ZW50IGNoYW5uZWxzLjxicj4NCjxicj4NCkFsc28s
IHN0YXRpYyBldnRjaG5zIHRvIGJlIGF2YWlsYWJsZSBmb3IgdXNlIGR1cmluZyB0aGUgbGlmZXRp
bWUgb2YgdGhlPGJyPg0KZ3Vlc3QuIFdoZW4gdGhlIGFwcGxpY2F0aW9uIGV4aXRzLCBfX3VuYmlu
ZF9mcm9tX2lycSgpIGVuZCB1cDxicj4NCmJlaW5nIGNhbGxlZCBmcm9tIHJlbGVhc2UoKSBmb3Ag
YmVjYXVzZSBvZiB0aGF0IHN0YXRpYyBldnRjaG5zIGFyZTxicj4NCmdldHRpbmcgY2xvc2VkLiBU
byBhdm9pZCBjbG9zaW5nIHRoZSBzdGF0aWMgZXZlbnQgY2hhbm5lbCwgYWRkIHRoZSBuZXc8YnI+
DQpib29sIHZhcmlhYmxlICZxdW90O2lzX3N0YXRpYyZxdW90OyBpbiAmcXVvdDtzdHJ1Y3QgaXJx
X2luZm8mcXVvdDsgdG8gbWFyayB0aGUgZXZlbnQgY2hhbm5lbDxicj4NCnN0YXRpYyB3aGVuIGNy
ZWF0aW5nIHRoZSBldmVudCBjaGFubmVsIHRvIGF2b2lkIGNsb3NpbmcgdGhlIHN0YXRpYzxicj4N
CmV2dGNobi48YnI+DQo8YnI+DQpTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCAmbHQ7cmFodWwu
c2luZ2hAYXJtLmNvbSZndDs8YnI+DQotLS08YnI+DQombmJzcDtkcml2ZXJzL3hlbi9ldmVudHMv
ZXZlbnRzX2Jhc2UuYyB8ICZuYnNwOzcgKysrKystLTxicj4NCiZuYnNwO2RyaXZlcnMveGVuL2V2
dGNobi5jICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwO3wgMjIgKysrKysrKysrKysrKysrKystLS0tLTxicj4NCiZu
YnNwO2luY2x1ZGUvdWFwaS94ZW4vZXZ0Y2huLmggJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7fCAmbmJzcDs5ICsrKysrKysrKzxicj4NCiZuYnNwO2luY2x1ZGUveGVu
L2V2ZW50cy5oICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO3wgJm5ic3A7MiArLTxicj4NCiZuYnNwOzQgZmlsZXMg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSk8YnI+DQo8YnI+DQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgYi9kcml2ZXJzL3hlbi9l
dmVudHMvZXZlbnRzX2Jhc2UuYzxicj4NCmluZGV4IGM3NzE1ZjhiZDQ1Mi4uMzFmMmQzNjM0YWQ1
IDEwMDY0NDxicj4NCi0tLSBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jPGJyPg0K
KysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmM8YnI+DQpAQCAtMTEyLDYgKzEx
Miw3IEBAIHN0cnVjdCBpcnFfaW5mbyB7PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7dW5zaWduZWQgaW50IGlycV9lcG9jaDsgLyogSWYgZW9pX2Nw
dSB2YWxpZDogaXJxX2Vwb2NoIG9mIGV2ZW50ICovPGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7dTY0IGVvaV90aW1lOyAmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsvKiBUaW1lIGluIGpp
ZmZpZXMgd2hlbiB0byBFT0kuICovPGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7cmF3X3NwaW5sb2NrX3QgbG9jazs8YnI+DQorICZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO3U4IGlzX3N0YXRpYzsgJm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7LyogSXMgZXZlbnQgY2hh
bm5lbCBzdGF0aWMgKi88YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YnIgc3R5bGU9ImNhcmV0LWNvbG9y
OiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsg
Zm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdo
dDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1p
bmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdv
cmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVj
b3JhdGlvbjogbm9uZTsiPg0KPHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7
IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9y
bWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXIt
c3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4
dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4
OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsg
ZmxvYXQ6IG5vbmU7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyI+SQ0KIHRoaW5rIHdlIHNo
b3VsZCBhdm9pZCB1OC91MTYvdTMyIGFuZCBpbnN0ZWFkIHVzZSB1aW50OF90L3VpbnQxNl90L3Vp
bnQzMl90Ljwvc3Bhbj48YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQt
ZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBm
b250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2lu
Zzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFu
c2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Vi
a2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsiPg0KPGJy
IHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNh
OyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6
IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1h
bGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0
ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13
aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7Ij4NCjxzcGFuIHN0eWxlPSJjYXJldC1j
b2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEy
cHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13
ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRl
eHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFs
OyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0
LWRlY29yYXRpb246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFu
dDsiPkhvd2V2ZXINCiBpbiB0aGlzIGNhc2UsIHlvdSBjYW4gdXNlIGJvb2wuPC9zcGFuPjxiciBz
dHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsg
Zm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBu
b3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxp
Z246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUt
c3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lk
dGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyI+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4N
CjxkaXY+PGJyPg0KPC9kaXY+DQpNYWtlIHNlbnNlLiBJIHdpbGwgY2hhbmdlIHRvIGJvb2wgaW4g
bmV4dCBwYXRjaC48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlJlZ2FyZHMsPC9kaXY+
DQo8ZGl2PlJhaHVsPGJyPg0KPC9kaXY+DQo8YnI+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_116F2F6462624DE3B9ADADE21BD54E41armcom_--

