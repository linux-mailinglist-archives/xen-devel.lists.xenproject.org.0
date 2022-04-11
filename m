Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA0D4FBAF2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 13:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303006.516967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndsGH-0000rx-Ln; Mon, 11 Apr 2022 11:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303006.516967; Mon, 11 Apr 2022 11:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndsGH-0000pk-IT; Mon, 11 Apr 2022 11:31:13 +0000
Received: by outflank-mailman (input) for mailman id 303006;
 Mon, 11 Apr 2022 11:31:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfOQ=UV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ndsGF-0000pe-Lc
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 11:31:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9eea6e3-b98a-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 13:30:55 +0200 (CEST)
Received: from AM5PR0601CA0078.eurprd06.prod.outlook.com (2603:10a6:206::43)
 by AS8PR08MB6725.eurprd08.prod.outlook.com (2603:10a6:20b:394::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 11:30:59 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::44) by AM5PR0601CA0078.outlook.office365.com
 (2603:10a6:206::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 11:30:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Mon, 11 Apr 2022 11:30:58 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Mon, 11 Apr 2022 11:30:58 +0000
Received: from ef06a58dce58.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C952D9AF-0FBD-4819-8F38-F04FD74C3114.1; 
 Mon, 11 Apr 2022 11:30:47 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef06a58dce58.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Apr 2022 11:30:47 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB6PR0801MB2085.eurprd08.prod.outlook.com (2603:10a6:4:79::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 11:30:44 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 11:30:43 +0000
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
X-Inumbo-ID: d9eea6e3-b98a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTDKUHAUpe+/waBVD5kYEvtJYo45vb9UncZiq8/VLcM=;
 b=Gi7QP5CrQMtZ2Au3m+3JKwagYAAu5IJtfu1S6vGaJ4clyx9TYto8cQbG62a6fqeJWfdqv4as0Z6SxtrBItk3RQ7FYdzwitV7jlhgx83pCnAk+V6QmzI/pS1RHccKZOVRH0TPXkssMxjxcFjQd2uPzbyxL7QTD1ZXFnKCoTxfhuo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63ff32b3a0a88684
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyCUH3MZhZkY9graTjH/SoAFTORIJ0PjeCWG/8BmTid0bt26AB4pkUoVhO1c/EZ84nbQVJxgw64CbXQS0DNrbuAE1RJLOzHW8qZopQ2GOpD9RqFSpKmAwVEFL38IJcVoWLDHoFP7oF56xT/fB61AVljEZIToUg9vKRz9etJDJCdWiu31v+U1wJjZktyuA9L46XntJbMfN3TMD/NNlGvSLEV1PELqHae+zPtLG1lwFbxKmfdKRMDL5bv4ZKx8/pi00ghZoQMJ/kM7e3EjosKtR9UNJ/kGPdEhxL97EvCD9womsZQHrzx96O4+wIAVNTw/AuN9DnFb0gLVxho9ViB2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTDKUHAUpe+/waBVD5kYEvtJYo45vb9UncZiq8/VLcM=;
 b=Vvw6yLzw034r39HtwzESRCfsPHznAeYZz22Ewkx+twGZTzKivTpR3b/Zzz1zUSvgHiTkmzfkC6uBnlrcKqm+vEfrB609U+fyV3WMLr6N0VsY863QckhAonMMZwNUsfbUVeOq9h28w03TW64mDbPjU0427DgFnmWuXZBie5wy8jcOpSoq4hwzbXbAzZdFtrFWGeylpIpgoKViu6+gwFB7bskVfpH9/oOyyvd9fsq/vfOqoNdsf+z9MEePk4/Kyj+JPBvg/DwpVhL7G3z1PHB3sunDUnRbv0NSv/RpsHh2ZOEz9123UegZv9AHGF3YY9J3eUHF7lVmig5BAW5mG8oNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTDKUHAUpe+/waBVD5kYEvtJYo45vb9UncZiq8/VLcM=;
 b=Gi7QP5CrQMtZ2Au3m+3JKwagYAAu5IJtfu1S6vGaJ4clyx9TYto8cQbG62a6fqeJWfdqv4as0Z6SxtrBItk3RQ7FYdzwitV7jlhgx83pCnAk+V6QmzI/pS1RHccKZOVRH0TPXkssMxjxcFjQd2uPzbyxL7QTD1ZXFnKCoTxfhuo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYSyUg2T6WkJDiXECW3myZV3L//qzqj+GAgAAI/AA=
Date: Mon, 11 Apr 2022 11:30:42 +0000
Message-ID: <16C126D9-18EF-440E-BD84-6D5028BFE879@arm.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
 <a052e26c-2142-bf51-bc80-449476ed0854@xen.org>
In-Reply-To: <a052e26c-2142-bf51-bc80-449476ed0854@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dd8bf365-b364-4bbd-eea5-08da1baebffc
x-ms-traffictypediagnostic:
	DB6PR0801MB2085:EE_|VE1EUR03FT022:EE_|AS8PR08MB6725:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB672597B57CFF24C424A6523AE4EA9@AS8PR08MB6725.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5rg7XSuNyQ5vkKcrveuPJzsBfdnYj/AJHULJiyktrdaEoX3CK3VsluszViIpLF97XLvr+3YT8Z8T4fDBOscljFCCpibcZatyOKdftpqlDxbid0x5IR9bdjZSjlaAhFiNeydSHuuxZq4KSm/JeF7juQqm6njE0q7/1AAgiBVRwSq0kNamC/sJ5Wa+Uy9lSIsZusQBta5FCyb47Asp7/hfXqR8cCkZh2r7ivxIKPWPgGYmHKARBaoQszaZljhNDU+D9ozJ3E4u08kYOYg2KhXa38WSqBsEHnScuYne9ybWcmwbGUd2u0+yJN0dXVH+xSo/Lo0LJGAOqjHrQeWDv6ZWXsiWASqZPGkgLj/OMdpjBUJ25zQEGfbDjetabBWW9ZnEXAN07LwPt8i0Qvxxgm/r60qKX/vN9OpD6DXX2jvD7fMb4CUWQWQuZrtpTjw73ml/ISVt0CR2ih2Uig+od+hI6+dwlmXYQKeiXaoPXoRXm7Mhktucmp2Quxa2Yg87JS3KZhsXDHoDqWUjErsjfy/H5Khr31Ij2Kvl7aHNVdHOGGP2xrPH+u9Yl9NTzCG4hzH/sofEimkFVItiDuGFtFA1UfWX2N7Bv+HmJMaD6andEkTcuikizgxtzmFhCjBbMiUPnUo94kzkFkka7BkIO35e+qk4AaOF9J5U6nbhZ3Vc/N8c6i65nuTIqbEY+EwSbZD3MF77zwA3Htg5dcSB1q/fHehrOFeNP5qYp1IGC3eT628g6ZaQrRc7o7op6eMBhQss
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(55236004)(6506007)(53546011)(5660300002)(7416002)(26005)(33656002)(83380400001)(8936002)(186003)(6512007)(2616005)(36756003)(6916009)(54906003)(86362001)(508600001)(66556008)(76116006)(66446008)(66946007)(64756008)(66476007)(91956017)(4326008)(6486002)(8676002)(38070700005)(71200400001)(38100700002)(122000001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F08BFEDB51A7B49B91442FE628F69C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2085
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c64d040-ee15-464e-7ce0-08da1baeb6e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3+6yE7jZAGWUZZpanqzxpaBkJ7nOiMZOw8apDIg8I2JObbkd0fLw4WQTXJ+Uk2+JCouJRt7ggB29lvCkW+fxgGq9ZBa4FKt3ladXH2TtChIZvhPhDYUyPRzBZ9A21UPBEBD1KDP33zHhOlGZchJVT493W0IQ9T4Y6gos+ualvUxXU8kSYrfCJ/eMUtfAtEI3OC2KYygptSgGqOkVbzhg5wcadycuqkqnTnM6B7L1ltUwhkWuxeISm5l9LBsNqOZYGMDxxQ//GBGIwRy92fin7Uz0X5ILKC7DDh25aNvoEi2RR2Z3aH8tbUGR1u3AQfHZLyiLjrskfp8BJkJK8IgRWumR8Qhurhsy7m431TZ8zQq6zceQn6khV7esHol3HLyzXX3OiTm/38zC9zorTvmdx7TGlI4DJjAFWqPg8JPdc/dbGJEP60yAqWAuHp2PioGm31kWLgsKm8evYbJTRfQq6ku8WZoh7pwuhnqyNaoywU8rD0ea2I/ofhBh8TgcjvFE+66QL1mP5hIH/0us8ezdhs290pLo2E1GKvoV/F2gPc+SU0dzWTQObDH/xS6V5RRxXYAR0+5Unn/zoVd0xsRKeFX2ADTArUtnZLiFVAB/lIAM0vUn0n0mjMhEkD6CTvY3hdHJIPNwLOYPN2BzMsaGMPseec19bfAMhL/OrBZrdnOh/MLdj75OlqS6L8knwcuS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(81166007)(70206006)(70586007)(2906002)(356005)(5660300002)(8936002)(316002)(4326008)(2616005)(6506007)(6862004)(86362001)(53546011)(6512007)(83380400001)(47076005)(6486002)(336012)(186003)(40460700003)(54906003)(508600001)(107886003)(36860700001)(33656002)(82310400005)(36756003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 11:30:58.4187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8bf365-b364-4bbd-eea5-08da1baebffc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6725

DQoNCj4gT24gMTEgQXByIDIwMjIsIGF0IDExOjU4LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAwOC8wNC8yMDIyIDA5OjQ1LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vZGV2aWNl
LXRyZWUvY3B1cG9vbHMudHh0IGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9jcHVwb29scy50
eHQNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjQwY2M4
MTM1YzY2Zg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZG9jcy9taXNjL2FybS9kZXZpY2Ut
dHJlZS9jcHVwb29scy50eHQNCj4+IEBAIC0wLDAgKzEsMTQwIEBADQo+PiArQm9vdCB0aW1lIGNw
dXBvb2xzDQo+PiArPT09PT09PT09PT09PT09PT09DQo+PiArDQo+PiArV2hlbiBCT09UX1RJTUVf
Q1BVUE9PTFMgaXMgZW5hYmxlZCBpbiB0aGUgWGVuIGNvbmZpZ3VyYXRpb24sIGl0IGlzIHBvc3Np
YmxlIHRvDQo+PiArY3JlYXRlIGNwdXBvb2xzIGR1cmluZyBib290IHBoYXNlIGJ5IHNwZWNpZnlp
bmcgdGhlbSBpbiB0aGUgZGV2aWNlIHRyZWUuDQo+PiArQUNQSSBpcyBub3Qgc3VwcG9ydGVkIGZv
ciB0aGlzIGZlYXR1cmUuDQo+PiArDQo+PiArQ3B1cG9vbHMgc3BlY2lmaWNhdGlvbiBub2RlcyBz
aGFsbCBiZSBkaXJlY3QgY2hpbGRzIG9mIC9jaG9zZW4gbm9kZS4NCj4+ICtFYWNoIGNwdXBvb2wg
bm9kZSBjb250YWlucyB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6DQo+PiArDQo+PiArLSBjb21w
YXRpYmxlIChtYW5kYXRvcnkpDQo+PiArDQo+PiArICAgIE11c3QgYWx3YXlzIGluY2x1ZGUgdGhl
IGNvbXBhdGlibGl0eSBzdHJpbmc6ICJ4ZW4sY3B1cG9vbCIuDQo+PiArDQo+PiArLSBjcHVwb29s
LWNwdXMgKG1hbmRhdG9yeSkNCj4+ICsNCj4+ICsgICAgTXVzdCBiZSBhIGxpc3Qgb2YgZGV2aWNl
IHRyZWUgcGhhbmRsZSB0byBub2RlcyBkZXNjcmliaW5nIGNwdXMgKGUuZy4gaGF2aW5nDQo+PiAr
ICAgIGRldmljZV90eXBlID0gImNwdSIpLCBpdCBjYW4ndCBiZSBlbXB0eS4NCj4+ICsNCj4+ICst
IGNwdXBvb2wtc2NoZWQgKG9wdGlvbmFsKQ0KPj4gKw0KPj4gKyAgICBNdXN0IGJlIGEgc3RyaW5n
IGhhdmluZyB0aGUgbmFtZSBvZiBhIFhlbiBzY2hlZHVsZXIuIENoZWNrIHRoZSBzY2hlZD08Li4u
Pg0KPj4gKyAgICBib290IGFyZ3VtZW50IGZvciBhbGxvd2VkIHZhbHVlcyBbMV0uIFdoZW4gdGhp
cyBwcm9wZXJ0eSBpcyBvbWl0dGVkLCB0aGUgWGVuDQo+PiArICAgIGRlZmF1bHQgc2NoZWR1bGVy
IHdpbGwgYmUgdXNlZC4NCj4+ICsNCj4+ICsNCj4+ICtDb25zdHJhaW50cw0KPj4gKz09PT09PT09
PT09DQo+PiArDQo+PiArSWYgbm8gY3B1cG9vbHMgYXJlIHNwZWNpZmllZCwgYWxsIGNwdXMgd2ls
bCBiZSBhc3NpZ25lZCB0byBvbmUgY3B1cG9vbA0KPj4gK2ltcGxpY2l0bHkgY3JlYXRlZCAoUG9v
bC0wKS4NCj4+ICsNCj4+ICtJZiBjcHVwb29scyBub2RlIGFyZSBzcGVjaWZpZWQsIGJ1dCBub3Qg
ZXZlcnkgY3B1IGJyb3VnaHQgdXAgYnkgWGVuIGlzIGFzc2lnbmVkLA0KPj4gK2FsbCB0aGUgbm90
IGFzc2lnbmVkIGNwdSB3aWxsIGJlIGFzc2lnbmVkIHRvIGFuIGFkZGl0aW9uYWwgY3B1cG9vbC4N
Cj4+ICsNCj4+ICtJZiBhIGNwdSBpcyBhc3NpZ25lZCB0byBhIGNwdXBvb2wsIGJ1dCBpdCdzIG5v
dCBicm91Z2h0IHVwIGNvcnJlY3RseSwgWGVuIHdpbGwNCj4+ICtzdG9wLg0KPj4gKw0KPj4gK1Ro
ZSBib290IGNwdSBtdXN0IGJlIGFzc2lnbmVkIHRvIFBvb2wtMCwgc28gdGhlIGNwdXBvb2wgY29u
dGFpbmluZyB0aGF0IGNvcmUNCj4+ICt3aWxsIGJlY29tZSBQb29sLTAgYXV0b21hdGljYWxseS4N
Cj4+ICsNCj4+ICsNCj4+ICtFeGFtcGxlcw0KPj4gKz09PT09PT09DQo+PiArDQo+PiArQSBzeXN0
ZW0gaGF2aW5nIHR3byB0eXBlcyBvZiBjb3JlLCB0aGUgZm9sbG93aW5nIGRldmljZSB0cmVlIHNw
ZWNpZmljYXRpb24gd2lsbA0KPj4gK2luc3RydWN0IFhlbiB0byBoYXZlIHR3byBjcHVwb29sczoN
Cj4+ICsNCj4+ICstIFRoZSBjcHVwb29sIHdpdGggaWQgMCB3aWxsIGhhdmUgNCBjcHVzIGFzc2ln
bmVkLg0KPj4gKy0gVGhlIGNwdXBvb2wgd2l0aCBpZCAxIHdpbGwgaGF2ZSAyIGNwdXMgYXNzaWdu
ZWQuDQo+IA0KPiBBRkFJSywgdGhlcmUgYXJlIG5vIGd1YXJhbnRlZSB0aGF0IFhlbiB3aWxsIHBh
cnNlIGNwdXBvb2xfYSBmaXJzdC4gU28gaXQgd291bGQgYmUgcG9zc2libGUgdGhhdCB0aGUgSUQg
YXJlIGludmVydGVkIGhlcmUuDQo+IA0KPiBUaGlzIGNvdWxkIGhhcHBlbiBpZiB5b3Ugd2FudCB0
byBrZWVwIHRoZSBib290IENQVSBpbiBwb29sIDAgYW5kIGl0IGlzIG5vdCBjcHVAMCAoc29tZSBi
b290bG9hZGVycyBhbGxvd3MgeW91IHRvIGNoYW5nZSB0aGUgYm9vdCBDUFUpLg0KDQpIaSBKdWxp
ZW4sDQoNClllcyBJIHdpbGwgc3BlY2lmeSB0aGF0IHRoZSBib290IGNwdSBpcyBsaXN0ZWQgaW4g
Y3B1cG9vbF9hLCBzbyB0aGF0IGNwdXBvb2wgd2lsbCBoYXZlIGlkIDAgcmVnYXJkbGVzcyBvZiB0
aGUgcGFyc2luZyBvcmRlci4NCg0KPiANCj4gQWxzbywgaGVyZSB5b3Ugd3JpdGUgIlRoZSBjcHVw
b29sIHdpdGggaWQgWCIgYnV0IC4uLg0KPiANCj4+ICtBIHN5c3RlbSBoYXZpbmcgdGhlIGNwdXBv
b2xzIHNwZWNpZmljYXRpb24gYmVsb3cgd2lsbCBpbnN0cnVjdCBYZW4gdG8gaGF2ZSB0aHJlZQ0K
Pj4gK2NwdXBvb2xzOg0KPj4gKw0KPj4gKy0gVGhlIGNwdXBvb2wgUG9vbC0wIHdpbGwgaGF2ZSAy
IGNwdXMgYXNzaWduZWQuDQo+PiArLSBUaGUgY3B1cG9vbCBQb29sLTEgd2lsbCBoYXZlIDIgY3B1
cyBhc3NpZ25lZC4NCj4+ICstIFRoZSBjcHVwb29sIFBvb2wtMiB3aWxsIGhhdmUgMiBjcHVzIGFz
c2lnbmVkIChjcmVhdGVkIGJ5IFhlbiB3aXRoIGFsbCB0aGUgbm90DQo+PiArICBhc3NpZ25lZCBj
cHVzIGE1M18zIGFuZCBhNTNfNCkuDQo+IA0KPiBoZXJlIHlvdSB3cml0ZSAiVGhlIGNwdXBvb2wg
UG9vbC1YIi4gQ2FuIHlvdSBiZSBjb25zaXN0ZW50Pw0KDQpTdXJlLCBkbyB5b3UgaGF2ZSBhIHBy
ZWZlcmVuY2UgYmV0d2VlbiDigJxUaGUgY3B1cG9vbCB3aXRoIGlkIFjigJ0gYW5kIOKAnFBvb2wt
WOKAnT8gT3RoZXJ3aXNlIEkgd291bGQgZ28gZm9yIFBvb2wtWCBldmVyeXdoZXJlLg0KDQo+IA0K
PiBPbiBhIHNlcGFyYXRlIHRvcGljLCBJIHRoaW5rIGRvbTBfbWF4X3ZjcHVzKCkgbmVlZHMgdG8g
YmUgdXBkYXRlZCB0byBieSBkZWZhdWx0IChpLmUgd2hlbiBvcHRfZG9tMF9tYXhfdmNwdXMgPT0g
MCkgdGhlIG51bWJlciBvZiB2Q1BVcyBtYXRjaCB0aGUgbnVtYmVyIG9mIHZDUFVzIGluIHRoZSBj
cHVwb29sIChJIHRoaW5rIDApIHVzZWQgdG8gY3JlYXRlZCBkb20wLg0KDQpZZXMgcmlnaHQsIEkg
ZGlkbuKAmXQgdGhpbmsgYWJvdXQgdGhhdCwgSSB0aGluayB0aGUgY2hhbmdlIGNvdWxkIGJlIHNv
bWV0aGluZyBsaWtlIHRoYXQ6DQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCmluZGV4IDljNjdhNDgzZDRhNC4u
OTc4NzEwNGMzZDMxIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQor
KysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCkBAIC03Myw3ICs3MywxMCBAQCBjdXN0
b21fcGFyYW0oImRvbTBfbWVtIiwgcGFyc2VfZG9tMF9tZW0pOw0KIHVuc2lnbmVkIGludCBfX2lu
aXQgZG9tMF9tYXhfdmNwdXModm9pZCkNCiB7DQogICAgIGlmICggb3B0X2RvbTBfbWF4X3ZjcHVz
ID09IDAgKQ0KLSAgICAgICAgb3B0X2RvbTBfbWF4X3ZjcHVzID0gbnVtX29ubGluZV9jcHVzKCk7
DQorICAgIHsNCisgICAgICAgIEFTU0VSVChjcHVwb29sMCk7DQorICAgICAgICBvcHRfZG9tMF9t
YXhfdmNwdXMgPSBjcHVtYXNrX3dlaWdodChjcHVwb29sX3ZhbGlkX2NwdXMoY3B1cG9vbDApKTsN
CisgICAgfQ0KICAgICBpZiAoIG9wdF9kb20wX21heF92Y3B1cyA+IE1BWF9WSVJUX0NQVVMgKQ0K
ICAgICAgICAgb3B0X2RvbTBfbWF4X3ZjcHVzID0gTUFYX1ZJUlRfQ1BVUzsNCg0KQW5kIGlmIHlv
dSBhZ3JlZSBJIHdpbGwgaW5jbHVkZSB0aGUgY2hhbmdlcyBmb3IgdGhlIHY3Lg0KDQpDaGVlcnMs
DQpMdWNhDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

