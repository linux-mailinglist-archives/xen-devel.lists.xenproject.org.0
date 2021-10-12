Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBAC429EE2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 09:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206812.362469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCTK-000229-J3; Tue, 12 Oct 2021 07:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206812.362469; Tue, 12 Oct 2021 07:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCTK-00020A-FV; Tue, 12 Oct 2021 07:45:14 +0000
Received: by outflank-mailman (input) for mailman id 206812;
 Tue, 12 Oct 2021 07:45:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8jq=PA=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maCTJ-000204-0W
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 07:45:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5443f704-2b30-11ec-811a-12813bfff9fa;
 Tue, 12 Oct 2021 07:45:11 +0000 (UTC)
Received: from AM6PR01CA0070.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::47) by VI1PR08MB3053.eurprd08.prod.outlook.com
 (2603:10a6:803:45::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 07:45:08 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::9f) by AM6PR01CA0070.outlook.office365.com
 (2603:10a6:20b:e0::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Tue, 12 Oct 2021 07:45:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 07:45:08 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Tue, 12 Oct 2021 07:45:07 +0000
Received: from 8eb322abf5dd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC606DAF-1618-47F8-B52E-DCE4215067A2.1; 
 Tue, 12 Oct 2021 07:45:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8eb322abf5dd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 07:45:01 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0802MB2183.eurprd08.prod.outlook.com (2603:10a6:4:84::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 07:44:49 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 07:44:49 +0000
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
X-Inumbo-ID: 5443f704-2b30-11ec-811a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUAl/sM9s17G+Kd5NIK07BU8aGRMTtMauo0zrZm1+Fo=;
 b=xZ9ou9agT3bxiIG9Yy//o605dTDtOOw61jFrM6V2JCWyjkR8u8lRFhD4bB+N1m1JIYxj7W1jr9DCNDHxNQ77+Vxa/oUvIcfdX2n80nk574m8eCEcoghRTQqx3TKPWbirKX04kzl4xl1rZQLiwgvPbihNUVVnCZXUwxBoncQRPDY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a467c569c1c0927e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+CrAho0ISpSkQEbX54xe+esbQkf7yLN4ksQ44PNkGTGcBPdbkY4JK08HzSI/uw8bSrBO6BjmwFfk5W/6EjaCW3jEqORrCJ1GC1rENlg8Y4pBTt26s9MrNys9W4D3NXbzJBBczTtN8T7LTH2D98CXEtLEPW1nJ0Ip9Nbp1jdhRmLYLFoq0BBbUYiRp8/BOVg8mlyEg8eEe5agnk1FvOCeJduGrNxZIQv3AkpJfe4/NsQNZJdGR5aZWr1ofjPhATknK2ZB2/mWBN5/u4WsvNjo271FnDXjAl47wzSrXivf57AAQdjTW/nlnXEpgu9wXZTsNSlug9NkJeiv43Pt48l+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUAl/sM9s17G+Kd5NIK07BU8aGRMTtMauo0zrZm1+Fo=;
 b=I8cThLSmS+CBImVnflgalfe3eXnin6k/CoevhnJF4Wdn5JRXep4Xt00AxWjYCKoak4T/7jJJV9LzjzJS0Bc5jlRONB2z8eru5pHptplT5EqlXMIkiGwW4RicvCVdqF9yhxbRUqwfzHeIMLMKpCHC9RdFVp0itTMZCX80QPeO9LWakiKqWcxCPDhHuQ3zzJPKxPxE2FXN45ry30NSHyn+pw+dikktcE4btO6HxFeEvvj4uwoY5ruWunK7DyeriIKA/ZIejWOBbXbm1lCFQhK0O37kHYH9yGD70UqVNZ22hadCKm1N+uA9n+yqIOoNWa/XFQ3n1LrUsWeV11LxVbLtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUAl/sM9s17G+Kd5NIK07BU8aGRMTtMauo0zrZm1+Fo=;
 b=xZ9ou9agT3bxiIG9Yy//o605dTDtOOw61jFrM6V2JCWyjkR8u8lRFhD4bB+N1m1JIYxj7W1jr9DCNDHxNQ77+Vxa/oUvIcfdX2n80nk574m8eCEcoghRTQqx3TKPWbirKX04kzl4xl1rZQLiwgvPbihNUVVnCZXUwxBoncQRPDY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index:
 AQHXutl3YqS5dHXsYk6KpdKt4d14RavNphKAgABZ5QCAAAISgIAABoqAgAAJBQCAABTvgIAAD/UAgADN4QA=
Date: Tue, 12 Oct 2021 07:44:49 +0000
Message-ID: <0DF5666A-937D-42A5-A521-0387F6BEE765@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWQXF2vDaWQvi+bT@MacBook-Air-de-Roger.local>
 <4F406854-4F90-48F6-8470-6CCB60A3CB77@arm.com>
 <e199bfe2-0bcc-989f-fd4a-ecf44a3cd1ac@epam.com>
 <YWRpuUtHkyA4RY5H@MacBook-Air-de-Roger.local>
 <AF7AB609-3E79-4017-A296-CC7C87E1705F@arm.com>
 <611b61a4-9635-f1e6-a078-e40d4cbd49fd@epam.com>
 <alpine.DEB.2.21.2110111226220.25528@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110111226220.25528@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 24dccaf6-2c09-484d-45b9-08d98d543691
x-ms-traffictypediagnostic: DB6PR0802MB2183:|VI1PR08MB3053:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3053C3AF35C4F44CF69228969DB69@VI1PR08MB3053.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uKz/Ucsjsih/t1EOceNpJa3hSUDEk5w5dE2EuABt6y2ixSsssuzp0MhcFRkQ9HCp3MrCn0MV1Gwsl9/JR5wYkcRFLrC7SvRnnOLlOHQG5s5h1syHsAVvgFVVNBREA49gg1nYSpYqUGLKW5etIHmSF9QWNaEPV0vzWmQQNwHNWa931GXvG2fvTFuFg84bxuXdbJ2k5WR+WhAu3MrRO8aBnQMIxDnMVe/sLKjHfH+3pGB0iLr2SZU7Doy6rs1PXN6wL2U5pM6FSL/ra/n2a4X7vFblmkAgpJBi5FP7hC9uDU9gEbHNSERR5UwJE/eVBRn0t8oQL+TCs2afCggvS4TDSnbP+/x5Km+Hp91J13Hag0vpngBwd+7Yl9+gGBs2k9n9+rGhDvVSM/hqR6rV82iztwoYgdEcCOuPmQ4zg1/DA5f+sVbe/WiHgNKqcU2gJJmKXAPZOxk0G7xh5ykaesSDnN62iDc9xQwBvYLRwVLRqqp033nHVHs23iMb2p/n2sssUD/mRwL5oWOB2a97vOraK0Xw4OW1QLhSpGbX3EnXcOoiWSNj43svSmKpv/fnKJgwAe39gq/+ra/Vax4FYHrtgSicfsD/LF5Dq2xXNu8Vx4YOEObo0e8nSp4oZK4yd652ag9NqzZKdPWVUR393sQhxcslhHBjnGl21Y5fDbe8r96qkiV4rOQEzmVXLIziywbWE6CiWWFjg8x40zDleXOP7nrlm+Ty5m2ZQbtS2imoEkZrxWSmdB6OWJ/IdZIAdJbM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(53546011)(5660300002)(6486002)(6506007)(71200400001)(6916009)(8936002)(38100700002)(122000001)(4326008)(8676002)(26005)(83380400001)(66476007)(36756003)(64756008)(66556008)(86362001)(7416002)(33656002)(316002)(54906003)(2906002)(508600001)(2616005)(6512007)(66446008)(91956017)(186003)(76116006)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA97348E26A89F47A9185C13D91D298C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2183
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	805d50d9-1569-4438-1601-08d98d542b52
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EeCcLv/5wHLKSP3r5TSpvmiomjuY1RsSpLTISUYFTzwKdzH5QRfukpnKumJaT6FHnKsIG7zlVHqS6igNMvmiWxD+duUrDQQpXO/aaUCS9LNHIpU1DvuSPiuA13wAQylIJu6NvlePtJsgR6pFRFdEUq496Xb4NwTntLojpnuuudf8XkASDT/W2oiXQxN5NRb2M3KC32k3Qt4aliQEwhuExQYhG+GcIQoAtgfkyNRuyHkpxS7fw8fMKgO/QCTEcM8yPE98HiWYwaS49mhrPDFxtYoKP1UmsGmh0EKgSHdOeHHecHxU4NvxGY5sXFlgyZU22ZqfXTVTEeJ5dXfLIzzlHW443ypC0wOncynhoYpwZh7beX8X9dVU90qW+dbHK/d3j4PgoMMFbiCWLdG1Unwzde9X8PIuh78i1+795HAi3OUQomMyKMZkjsoUaT+enEVbVSjyuIhYXwnf1sfHGJl3unPNtHWk+EfcRIvtnbOAmJAOvdHN2r0JP2s8gspMpBiS59c4In6YGrB8tuv5vbnZcmR9YJaHwkDwzAwrpR1NAoQX7MIijX/qvuVIHclxWaBvlW0jqzJJcve7lcJ0190O2coUkHo2dsxiqKOOvdDU3mapTIxTLHqwbnq1EyKaA6bJsX2Vd8kXFFtFjQIGcowTYakevUYLOitOQGF2QJ51cJJkr0uSTajw53el5Hw6nQSAN/J3TrHyXXXXRLzLOFw5IQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(2616005)(508600001)(47076005)(82310400003)(8936002)(8676002)(81166007)(83380400001)(356005)(2906002)(36860700001)(86362001)(36756003)(6512007)(33656002)(53546011)(4326008)(6486002)(5660300002)(316002)(26005)(186003)(70586007)(70206006)(6506007)(6862004)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:45:08.0476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24dccaf6-2c09-484d-45b9-08d98d543691
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3053

SGkgU3RlZmFubywNCg0KPiBPbiAxMSBPY3QgMjAyMSwgYXQgMjA6MjcsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDExIE9j
dCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9uIDExLjEwLjIxIDIw
OjE1LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IEhpIFJvZ2VyLA0KPj4+IA0KPj4+PiBP
biAxMSBPY3QgMjAyMSwgYXQgMTc6NDMsIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IE9uIE1vbiwgT2N0IDExLCAyMDIxIGF0IDA0OjIw
OjE0UE0gKzAwMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4gDQo+Pj4+
PiBPbiAxMS4xMC4yMSAxOToxMiwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+PiBIaSBS
b2dlciwNCj4+Pj4+PiANCj4+Pj4+Pj4gT24gMTEgT2N0IDIwMjEsIGF0IDExOjUxLCBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+Pj4+IA0KPj4+Pj4+
PiBPbiBXZWQsIE9jdCAwNiwgMjAyMSBhdCAwNjo0MDozNFBNICswMTAwLCBSYWh1bCBTaW5naCB3
cm90ZToNCj4+Pj4+Pj4+IFRoZSBleGlzdGluZyBWUENJIHN1cHBvcnQgYXZhaWxhYmxlIGZvciBY
ODYgaXMgYWRhcHRlZCBmb3IgQXJtLg0KPj4+Pj4+Pj4gV2hlbiB0aGUgZGV2aWNlIGlzIGFkZGVk
IHRvIFhFTiB2aWEgdGhlIGh5cGVyIGNhbGwNCj4+Pj4+Pj4+IOKAnFBIWVNERVZPUF9wY2lfZGV2
aWNlX2FkZOKAnSwgVlBDSSBoYW5kbGVyIGZvciB0aGUgY29uZmlnIHNwYWNlDQo+Pj4+Pj4+PiBh
Y2Nlc3MgaXMgYWRkZWQgdG8gdGhlIFhlbiB0byBlbXVsYXRlIHRoZSBQQ0kgZGV2aWNlcyBjb25m
aWcgc3BhY2UuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IEEgTU1JTyB0cmFwIGhhbmRsZXIgZm9yIHRo
ZSBQQ0kgRUNBTSBzcGFjZSBpcyByZWdpc3RlcmVkIGluIFhFTg0KPj4+Pj4+Pj4gc28gdGhhdCB3
aGVuIGd1ZXN0IGlzIHRyeWluZyB0byBhY2Nlc3MgdGhlIFBDSSBjb25maWcgc3BhY2UsWEVODQo+
Pj4+Pj4+PiB3aWxsIHRyYXAgdGhlIGFjY2VzcyBhbmQgZW11bGF0ZSByZWFkL3dyaXRlIHVzaW5n
IHRoZSBWUENJIGFuZA0KPj4+Pj4+Pj4gbm90IHRoZSByZWFsIFBDSSBoYXJkd2FyZS4NCj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4gRm9yIERvbTBsZXNzIHN5c3RlbXMgc2Nhbl9wY2lfZGV2aWNlcygpIHdv
dWxkIGJlIHVzZWQgdG8gZGlzY292ZXIgdGhlDQo+Pj4+Pj4+PiBQQ0kgZGV2aWNlIGluIFhFTiBh
bmQgVlBDSSBoYW5kbGVyIHdpbGwgYmUgYWRkZWQgZHVyaW5nIFhFTiBib290cy4NCj4+Pj4+Pj4+
IA0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5j
b20+DQo+Pj4+Pj4+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPg0KPj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+PiBDaGFuZ2UgaW4gdjU6DQo+Pj4+
Pj4+PiAtIEFkZCBwY2lfY2xlYW51cF9tc2kocGRldikgaW4gY2xlYW51cCBwYXJ0Lg0KPj4+Pj4+
Pj4gLSBBZGRlZCBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPg0KPj4+Pj4+Pj4gQ2hhbmdlIGluIHY0Og0KPj4+Pj4+Pj4gLSBNb3ZlIGFkZGl0
aW9uIG9mIFhFTl9ET01DVExfQ0RGX3ZwY2kgZmxhZyB0byBzZXBhcmF0ZSBwYXRjaA0KPj4+Pj4+
Pj4gQ2hhbmdlIGluIHYzOg0KPj4+Pj4+Pj4gLSBVc2UgaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJs
ZWQoKSBpbiBwbGFjZSBvZiBwY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCB2YXJpYWJsZQ0KPj4+Pj4+
Pj4gLSBSZWplY3QgWEVOX0RPTUNUTF9DREZfdnBjaSBmb3IgeDg2IGluIGFyY2hfc2FuaXRpc2Vf
ZG9tYWluX2NvbmZpZygpDQo+Pj4+Pj4+PiAtIFJlbW92ZSBJU19FTkFCTEVEKENPTkZJR19IQVNf
VlBDSSkgZnJvbSBoYXNfdnBjaSgpDQo+Pj4+Pj4+PiBDaGFuZ2UgaW4gdjI6DQo+Pj4+Pj4+PiAt
IEFkZCBuZXcgWEVOX0RPTUNUTF9DREZfdnBjaSBmbGFnDQo+Pj4+Pj4+PiAtIG1vZGlmeSBoYXNf
dnBjaSgpIHRvIGluY2x1ZGUgWEVOX0RPTUNUTF9DREZfdnBjaQ0KPj4+Pj4+Pj4gLSBlbmFibGUg
dnBjaSBzdXBwb3J0IHdoZW4gcGNpLXBhc3N0aG91Z2ggb3B0aW9uIGlzIGVuYWJsZWQuDQo+Pj4+
Pj4+PiAtLS0NCj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4geGVuL2FyY2gvYXJtL01ha2VmaWxlICAg
ICAgICAgfCAgIDEgKw0KPj4+Pj4+Pj4geGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICAgfCAg
IDQgKysNCj4+Pj4+Pj4+IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgIHwgICAzICsNCj4+
Pj4+Pj4+IHhlbi9hcmNoL2FybS92cGNpLmMgICAgICAgICAgIHwgMTAyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4+Pj4+Pj4+IHhlbi9hcmNoL2FybS92cGNpLmggICAgICAg
ICAgIHwgIDM2ICsrKysrKysrKysrKw0KPj4+Pj4+Pj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
cGNpLmMgfCAgMTggKysrKysrDQo+Pj4+Pj4+PiB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5o
ICB8ICAgNyArKy0NCj4+Pj4+Pj4+IHhlbi9pbmNsdWRlL2FzbS14ODYvcGNpLmggICAgIHwgICAy
IC0NCj4+Pj4+Pj4+IHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oIHwgICA3ICsrKw0KPj4+
Pj4+Pj4geGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgfCAgIDIgKw0KPj4+Pj4+Pj4gMTAg
ZmlsZXMgY2hhbmdlZCwgMTc5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4+Pj4+
PiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4+Pj4+Pj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS92cGNpLmgNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZSBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0K
Pj4+Pj4+Pj4gaW5kZXggNDRkN2NjODFmYS4uZmI5Yzk3NmVhMiAxMDA2NDQNCj4+Pj4+Pj4+IC0t
LSBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL01h
a2VmaWxlDQo+Pj4+Pj4+PiBAQCAtNyw2ICs3LDcgQEAgaWZuZXEgKCQoQ09ORklHX05PX1BMQVQp
LHkpDQo+Pj4+Pj4+PiBvYmoteSArPSBwbGF0Zm9ybXMvDQo+Pj4+Pj4+PiBlbmRpZg0KPj4+Pj4+
Pj4gb2JqLSQoQ09ORklHX1RFRSkgKz0gdGVlLw0KPj4+Pj4+Pj4gK29iai0kKENPTkZJR19IQVNf
VlBDSSkgKz0gdnBjaS5vDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IG9iai0kKENPTkZJR19IQVNfQUxU
RVJOQVRJVkUpICs9IGFsdGVybmF0aXZlLm8NCj4+Pj4+Pj4+IG9iai15ICs9IGJvb3RmZHQuaW5p
dC5vDQo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbi5jDQo+Pj4+Pj4+PiBpbmRleCAzNjEzOGMxYjJlLi5mYmI1MmY3OGYxIDEw
MDY0NA0KPj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+Pj4+Pj4+PiArKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4+Pj4+Pj4+IEBAIC0zOSw2ICszOSw3IEBADQo+Pj4+
Pj4+PiAjaW5jbHVkZSA8YXNtL3ZnaWMuaD4NCj4+Pj4+Pj4+ICNpbmNsdWRlIDxhc20vdnRpbWVy
Lmg+DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+ICsjaW5jbHVkZSAidnBjaS5oIg0KPj4+Pj4+Pj4gI2lu
Y2x1ZGUgInZ1YXJ0LmgiDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IERFRklORV9QRVJfQ1BVKHN0cnVj
dCB2Y3B1ICosIGN1cnJfdmNwdSk7DQo+Pj4+Pj4+PiBAQCAtNzY3LDYgKzc2OCw5IEBAIGludCBh
cmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4+Pj4+ICAgICBpZiAoIGlz
X2hhcmR3YXJlX2RvbWFpbihkKSAmJiAocmMgPSBkb21haW5fdnVhcnRfaW5pdChkKSkgKQ0KPj4+
Pj4+Pj4gICAgICAgICBnb3RvIGZhaWw7DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+ICsgICAgaWYgKCAo
cmMgPSBkb21haW5fdnBjaV9pbml0KGQpKSAhPSAwICkNCj4+Pj4+Pj4+ICsgICAgICAgIGdvdG8g
ZmFpbDsNCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICAgICByZXR1cm4gMDsNCj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4gZmFpbDoNCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4+Pj4+IGluZGV4IGM1YWZi
ZTJlMDUuLmY0Yzg5YmRlOGMgMTAwNjQ0DQo+Pj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMNCj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0K
Pj4+Pj4+Pj4gQEAgLTMwNTMsNiArMzA1Myw5IEBAIHZvaWQgX19pbml0IGNyZWF0ZV9kb20wKHZv
aWQpDQo+Pj4+Pj4+PiAgICAgaWYgKCBpb21tdV9lbmFibGVkICkNCj4+Pj4+Pj4+ICAgICAgICAg
ZG9tMF9jZmcuZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfaW9tbXU7DQo+Pj4+Pj4+PiANCj4+Pj4+
Pj4+ICsgICAgaWYgKCBpc19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCgpICkNCj4+Pj4+Pj4+ICsg
ICAgICAgIGRvbTBfY2ZnLmZsYWdzIHw9IFhFTl9ET01DVExfQ0RGX3ZwY2k7DQo+Pj4+Pj4+IEkg
dGhpbmsgSSdtIGNvbmZ1c2VkIHdpdGggdGhpcy4gWW91IHNlZW0gdG8gZW5hYmxlIHZQQ0kgZm9y
IGRvbTAsIGJ1dA0KPj4+Pj4+PiB0aGVuIGRvbWFpbl92cGNpX2luaXQgd2lsbCBzZXR1cCB0cmFw
cyBmb3IgdGhlIGd1ZXN0IHZpcnR1YWwgRUNBTQ0KPj4+Pj4+PiBsYXlvdXQsIG5vdCB0aGUgbmF0
aXZlIG9uZSB0aGF0IGRvbTAgd2lsbCBiZSB1c2luZy4NCj4+Pj4+PiBJIHRoaW5rIGFmdGVyIHRo
ZSBsYXN0IGRpc2N1c3Npb25zLCBpdCB3YXMgZGVjaWRlZCB0byBhbHNvIGluc3RhbGxlZCB0aGUg
dnBjaQ0KPj4+Pj4+IGhhbmRsZXIgZm9yIGRvbTAuIEkgd2lsbCBoYXZlIHRvIGxvb2sgaW50byB0
aGlzIGFuZCBjb21lIGJhY2sgdG8geW91Lg0KPj4+Pj4+IEBPbGVrc2FuZHI6IENvdWxkIHlvdSBj
b21tZW50IG9uIHRoaXMuDQo+Pj4+PiBZZXMsIHdlIGRvIHRyYXAgRG9tMCBhcyB3ZWxsLiBUaGUg
RG9tMCB0cmFwcyBhcmUgbm90IGluIHRoaXMgc2VyaWVzLCBidXQNCj4+Pj4+IGFyZSBpbiBtaW5l
IGFzIGl0IG5lZWRzIG1vcmUgcHJlcGFyYXRvcnkgd29yayBmb3IgdGhhdC4gUGxlYXNlIHNlZSBb
MV0NCj4+Pj4gVGhlbiBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBzZXQgWEVOX0RPTUNUTF9DREZf
dnBjaSBmb3IgZG9tMCBoZXJlLCBpdA0KPj4+PiBzaG91bGQgaW5zdGVhZCBiZSBkb25lIGluIHRo
ZSBwYXRjaCB3aGVyZSBkb20wIHN1cHBvcnQgaXMgaW50cm9kdWNlZC4NCj4+PiBPayBJIHdpbGwg
Y2hlY2sgdG8gcmVtb3ZlIHRoaXMgYW5kIGluY2x1ZGUgdGhlIGNoYW5nZSBpbiB2Ni4NCj4+IEp1
c3QgdG8gbWFrZSBpdCBjbGVhcjogZG8gd2Ugd2FudCB0byByZW1vdmUgdGhpcyBwaWVjZSBmcm9t
IHRoaXMgcGF0Y2gNCj4+IGFuZCBpbnN0ZWFkIGhhdmUgYSBkZWRpY2F0ZWQgcGF0Y2ggb24gdG9w
IG9mIG15IHNlcmllcywgc28gaXQgaXMgZW5hYmxlZA0KPj4gcmlnaHQgYWZ0ZXIgd2UgaGF2ZSB0
aGUgY29kZSB0aGF0IHNldHMgdXAgdGhlIHRyYXAgaGFuZGxlcnMgZm9yIERvbTA/DQo+PiBJZiBz
bywgdGhlbiBkbyB3ZSB3YW50IHRoYXQgcGF0Y2ggdG8gYmUgY2hhaW5lZCBpbiBteSBzZXJpZXMg
b3Igc2VudCBhcw0KPj4gYSBmb2xsb3cgdXAgcmlnaHQgYWZ0ZXIgaXQgc2VwYXJhdGVseT8NCj4g
DQo+IEkgdGhpbmsgd2Ugd2FudCB0byByZW1vdmUgdGhlIFhFTl9ET01DVExfQ0RGX3ZwY2kgY2h1
bmsgZnJvbSB0aGlzIHBhdGNoLg0KPiANCj4gV2hlcmUgZXhhY3RseSBpdCBzaG91bGQgYmUgaW50
cm9kdWNlZCwgSSBhbSBub3Qgc3VyZS4gSSB0aGluayBpdCB3b3VsZA0KPiBiZSBPSyBhcyBhIHNl
cGFyYXRlIHNpbmdsZSBwYXRjaCBhdCB0aGUgZW5kLiBJIGRvZXNuJ3QgaGF2ZSB0byBiZSBwYXJ0
DQo+IG9mIHRoZSBvdXRzdGFuZGluZyBzZXJpZXMsIGNvbnNpZGVyaW5nIHRoYXQgd2UgYXJlIGFs
c28gbWlzc2luZyB0aGUNCj4gcGF0Y2ggdG8gYWRkICJzZWxlY3QgSEFTX1BDSSIgZm9yIEFSTS4N
Cg0KQWdyZWUsIEkgd2lsbCByZW1vdmUgdGhhdCBmcm9tIHY2Lg0KDQpDaGVlcnMNCkJlcnRyYW5k
DQoNCg0K

