Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F73642A149
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 11:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207016.362734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEGo-0002jL-3F; Tue, 12 Oct 2021 09:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207016.362734; Tue, 12 Oct 2021 09:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEGn-0002gE-Vp; Tue, 12 Oct 2021 09:40:25 +0000
Received: by outflank-mailman (input) for mailman id 207016;
 Tue, 12 Oct 2021 09:40:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8jq=PA=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maEGm-0002g6-7n
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 09:40:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ac8061e-6608-44f2-a246-363dec1f8856;
 Tue, 12 Oct 2021 09:40:22 +0000 (UTC)
Received: from AM6P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::26)
 by VE1PR08MB5869.eurprd08.prod.outlook.com (2603:10a6:800:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 09:40:19 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::3) by AM6P195CA0013.outlook.office365.com
 (2603:10a6:209:81::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 12 Oct 2021 09:40:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 09:40:18 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Tue, 12 Oct 2021 09:40:17 +0000
Received: from 529144006467.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63EEF43E-4FCE-4EFA-81C5-392ABC75596D.1; 
 Tue, 12 Oct 2021 09:40:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 529144006467.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 09:40:11 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBBPR08MB6204.eurprd08.prod.outlook.com (2603:10a6:10:1f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 09:40:11 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 09:40:10 +0000
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
X-Inumbo-ID: 0ac8061e-6608-44f2-a246-363dec1f8856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlWQSlb09wP+zQ1sz9K4CIix3ZQ4bgwUujKrkjp9vU8=;
 b=0T5iJhaSML1a+hBABFUKfeIGysbWYaffYgqHAVPWy/tBNgg+utbgRjTDHtDvum6FUz7ix4q+BwNTocqedEw3BlNtiR4nrFSVcFaRaZpKoBHGWSzCiwCJQa/KJRqkpJbSpgdcBsfryQy1VD//VKg5yRC/G1F9W3Tkqp8qVHkgCuM=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass
 (signature was verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=temperror action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: adf5f7b01ff45300
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYXrsTR5ceamoxLqivWj9gGFi37aR4SMqB/ot+qYUZAy+278D8DPmuSDy90KEimVRWQ0clA1PrjBw4y420et1A21y03sHqZ+NORScbMaxVjE+sEgAtOM5Q6e35Rc0HyKRYvHscHE4PRJ7N/zQZ5IMyMmTsFnhqPQyWje7mk1Mm0H4+mqZ5SrZUfW8Fpcd16uCRPO0gC18dHrC+G1XKksx9dTcJQT9XlEddpggm0aR8rwmV+Pm4ozUEgFqEPMPmXINSWHjvVzK9VGpWQWqc6Oq5AAr2YCORzq/jUVAezEM8wLAntSVgb7mlyv8MIzW8+UrPao056o3YcFaMEbg6Qdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlWQSlb09wP+zQ1sz9K4CIix3ZQ4bgwUujKrkjp9vU8=;
 b=CbbyNrFlgLlkjL2IEWX/v0cJiLtHFArK0q+hpFIqrnRMrIm66cD3yJYUinCYPsXhTogvhLAU9Pb2LU4+OBhvbHEvhCFFA4npKIOfdHeymmOctUq1Yh2YX1oEjlN4KUbp2iAQ6ufGATSTt3T8bnTH46vu+shvxkdCwHq7rcOm+V2QjUVkF255BXG0q4QkSyuoci9rxs7G+/zPY0hNkqFWrxkkD6rBhpo6kEWCiYFMVX2LSARV+PxJkIhbKZCmfaXIqKh7OCuzl5JxAWWeV2EvQRpyi31GqVTrTn6mzqKXRGI2U66Gx3gWdqSFY4V2poATpDIA3yYjcy9EBCeIKGZdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlWQSlb09wP+zQ1sz9K4CIix3ZQ4bgwUujKrkjp9vU8=;
 b=0T5iJhaSML1a+hBABFUKfeIGysbWYaffYgqHAVPWy/tBNgg+utbgRjTDHtDvum6FUz7ix4q+BwNTocqedEw3BlNtiR4nrFSVcFaRaZpKoBHGWSzCiwCJQa/KJRqkpJbSpgdcBsfryQy1VD//VKg5yRC/G1F9W3Tkqp8qVHkgCuM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index:
 AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4CAABOEAIAABXoAgAAEuYCAAAVHAIAAJiWAgAAK0ICAAQCPgIAAA0qAgAAOJYCAAAI7AA==
Date: Tue, 12 Oct 2021 09:40:10 +0000
Message-ID: <76E73DCA-1AF0-4B64-9305-6C349280A911@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
 <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
 <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
 <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
 <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
In-Reply-To: <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7c3d05d3-ac9a-4c17-af6e-08d98d644d3c
x-ms-traffictypediagnostic: DBBPR08MB6204:|VE1PR08MB5869:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5869C9C1A8C2D7BD6AA8BFFF9DB69@VE1PR08MB5869.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hOwmJ/rimwcFR70Ane1p0Czh1CivafYzLCDGPZGi6ZAEBgAI/cfywv/2kslMK1+fy+V8RrcOEiL5bwthKrqtg6R6zNcZjMVfiHfEw9JcIHIE9IKnDhVtrOKEEelHe+r7qCYB8XfLpfLUHdsOwcaFzW2eeQXWbbSLCa7XkKWQ7qsnmekGUYN/c0gHW34q3MC6YjNgz2u5poKF6Xlb+yPPQrtrp+FaZGTdo5N0bzfqE2Udj4RvXiEOHhYQBd1yYcKshELhpHoQR1CQsXEMVzJ/SzNdrSD6UMMMBsjptk7Jke8olOsiUt4DzVKpIlwsE2rHXhQAChYRVESgE/IJ5kCbz2W45AlqwwxXUEZWL+GdVsLa7kVgvc7hes+s/5+PuDOrfpHL71bfE++AiQbz6NfcJcnyZHZFPDDh1Fnm6vu8QYBJodLgnf/A4zoiQd5a3c6hP+Or+WEiAGfO1dMxdH87IfeaWBx9uCpFlQl6sbzQwLMELub5MU64ROFxMydkga3pVst3oVH3oqBzw94NF43VfONyo4NLlf4/jEPorQzl5I4okfjWYLWJHWy244HpaVikct4YmQwo/RZdqy1KKeLLYWQ10dESIfSgqySb1M0Nrxl6F+AnGcBFZLA6nM1AmQOm3HjdrYX6WMJwnXeBnkPq73Bb99jqWBBUp80mWnvJI2xUqz11WvR7L0UgLm4Ipj9ptsDwCfRDhfRpKx/G2/UvFYTgUv7KSa9LuqgR47nhI8w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(38100700002)(76116006)(38070700005)(508600001)(54906003)(316002)(5660300002)(8936002)(83380400001)(2616005)(26005)(91956017)(64756008)(53546011)(66446008)(33656002)(4326008)(86362001)(8676002)(66946007)(66556008)(66476007)(71200400001)(6486002)(6512007)(36756003)(6916009)(186003)(6506007)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <99CB8C54D94C7649B920823C9535ED39@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6204
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	caa3a72e-463e-44cb-c441-08d98d6448f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6r3M3KPT9T3UIotAQG/mESXZi/ruv56s1mdLmBoQfb3dBaZzKeGgkGjCzod6RHwad2fc0YgZ1WJpk/cU3pSCSgHJRk3uW6ORDglZ0LvoF/HIvk27incaS2DCU37j2C4ArGkYrad0cSXS7sNG/r2fP33u4M/xFNZiDOj2cGqPJUrMG26M/+sflPQIftvPKKyOJgTgbjdvf/L/xzW/yO0CoG1N5CgCdzi3tQ6TCq/gh+rbgV1/wj1GeCMwaXkVis6g73Noyk1HojhgCn/7Tbcx9wn3IGOxBOnBo4Sk6pNPM6Y5seJxnV8VGtHNFe4aY1BcBma9QCyaM7CQv9IsnZxEi3p4YfGlFnTkY7giklFE400480UKUHp3fkbu6ziV9WF2oPKqJToyNasZKY2aU0lsVBeWotPCVRzuMgyhRGIDn/tYNs8/M6385l7xH4qKq/dqHTF8uaS74p6CVlSi5RAuNjSYooWLJWJa44RfguSPwRH5tJcanD4rOARWUN2A/FOnSbTr4B46sOQROZMceu16jbqjw6ktMuYfAsXmFvhpF0mD31scCxnAJuVUwUPiLSG1MngURvLLGKKUGi746BKeZ7dOInHtCpnXwvUNWS5Cwt1zv8h4oFYDKtg94Crc7iqgpJufb6vHuER1aBe7r9kPvHYADdmJT7DfuY9LLEet77Z4QVgO4/EytzckgY5M2UkMtfS/qGlGaUWF0wzEu119CjSKgfUNUPAEvdUYTQyAqlY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(70586007)(107886003)(36860700001)(508600001)(5660300002)(53546011)(86362001)(2616005)(336012)(54906003)(83380400001)(6506007)(47076005)(6512007)(26005)(316002)(8936002)(8676002)(82310400003)(356005)(4326008)(33656002)(81166007)(6862004)(6486002)(63350400001)(63370400001)(2906002)(186003)(36756003)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:40:18.0305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3d05d3-ac9a-4c17-af6e-08d98d644d3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5869

SGkgSmFuLA0KDQo+IE9uIDEyIE9jdCAyMDIxLCBhdCAxMDozMiwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDEyLjEwLjIwMjEgMTA6NDEsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKYW4sDQo+PiANCj4+PiBPbiAxMiBPY3QgMjAyMSwgYXQg
MDk6MjksIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g
T24gMTEuMTAuMjAyMSAxOToxMSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+IE9uIDEx
IE9jdCAyMDIxLCBhdCAxNzozMiwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+IHdyb3RlOg0KPj4+Pj4gT24gTW9uLCBPY3QgMTEsIDIwMjEgYXQgMDI6MTY6MTlQTSArMDAw
MCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4gT24gMTEgT2N0IDIwMjEsIGF0IDE0
OjU3LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+
Pj4+IEkgdGhpbmsgdGhlIGNvbW1pdCBtZXNzYWdlIG5lZWRzIHRvIGF0IGxlYXN0IGJlIGV4cGFu
ZGVkIGluIG9yZGVyIHRvDQo+Pj4+Pj4+IGNvbnRhaW4gdGhlIGluZm9ybWF0aW9uIHByb3ZpZGVk
IGhlcmUuIEl0IG1pZ2h0IGFsc28gYmUgaGVscGZ1bCB0bw0KPj4+Pj4+PiBmaWd1cmUgb3V0IHdo
ZXRoZXIgd2Ugd291bGQgaGF2ZSB0byBoYW5kbGUgSU8gcG9ydCBhY2Nlc3NlcyBpbiB0aGUNCj4+
Pj4+Pj4gZnV0dXJlIG9uIEFybSwgb3IgaWYgaXQncyBmaW5lIHRvIGp1c3QgaWdub3JlIHRoZW0u
DQo+Pj4+Pj4gDQo+Pj4+Pj4gQWxsIG91ciBpbnZlc3RpZ2F0aW9ucyBhbmQgdGVzdHMgaGF2ZSBi
ZWVuIGRvbmUgd2l0aG91dCBzdXBwb3J0aW5nIGl0DQo+Pj4+Pj4gd2l0aG91dCBhbnkgaXNzdWVz
IHNvIHRoaXMgaXMgbm90IGEgY3JpdGljYWwgZmVhdHVyZSAobW9zdCBkZXZpY2VzIGNhbg0KPj4+
Pj4+IGJlIG9wZXJhdGVkIHdpdGhvdXQgdXNpbmcgdGhlIEkvTyBwb3J0cykuDQo+Pj4+PiANCj4+
Pj4+IElNTyB3ZSBzaG91bGQgbGV0IHRoZSB1c2VycyBrbm93IHRoZXkgYXR0ZW1wdGVkIHRvIHVz
ZSBhIGRldmljZSB3aXRoDQo+Pj4+PiBCQVJzIGluIHRoZSBJTyBzcGFjZSwgYW5kIHRoYXQgdGhv
c2UgQkFScyB3b24ndCBiZSBhY2Nlc3NpYmxlIHdoaWNoDQo+Pj4+PiBjb3VsZCBtYWtlIHRoZSBk
ZXZpY2Ugbm90IGZ1bmN0aW9uIGFzIGV4cGVjdGVkLg0KPj4+Pj4gDQo+Pj4+PiBEbyB5b3UgdGhp
bmsgaXQgd291bGQgYmUgcmVhc29uYWJsZSB0byBhdHRlbXB0IHRoZSBoeXBlcmNhbGwgb24gQXJt
DQo+Pj4+PiBhbHNvLCBhbmQgaW4gY2FzZSBvZiBlcnJvciAob24gQXJtKSBqdXN0IHByaW50IGEg
d2FybmluZyBtZXNzYWdlIGFuZA0KPj4+Pj4gY29udGludWUgb3BlcmF0aW9ucyBhcyBub3JtYWw/
DQo+Pj4+IA0KPj4+PiBJIHRoaW5rIHRoaXMgd291bGQgbGVhZCB0byBhIHdhcm5pbmcgcHJpbnRl
ZCBvbiBsb3RzIG9mIGRldmljZXMgd2hlcmUgaW4NCj4+Pj4gZmFjdCB0aGVyZSB3b3VsZCBiZSBu
byBpc3N1ZXMuDQo+Pj4+IA0KPj4+PiBJZiB0aGlzIGlzIGFuIGlzc3VlIGZvciBhIGRldmljZSBk
cml2ZXIgYmVjYXVzZSBpdCBjYW5ub3Qgb3BlcmF0ZSB3aXRob3V0DQo+Pj4+IEkvTyBwb3J0cywg
dGhpcyB3aWxsIGJlIHJhaXNlZCBieSB0aGUgZHJpdmVyIGluc2lkZSB0aGUgZ3Vlc3QuDQo+Pj4g
DQo+Pj4gT24gd2hhdCBiYXNpcyB3b3VsZCB0aGUgZHJpdmVyIGNvbXBsYWluPyBUaGUga2VybmVs
IG1pZ2h0IGtub3cgb2YNCj4+PiB0aGUgTU1JTyBlcXVpdmFsZW50IGZvciBwb3J0cywgYW5kIGhl
bmNlIG1pZ2h0IGFsbG93IHRoZSBkcml2ZXINCj4+PiB0byBwcm9wZXJseSBvYnRhaW4gd2hhdGV2
ZXIgaXMgbmVlZGVkIHRvIGxhdGVyIGFjY2VzcyB0aGUgcG9ydHMuDQo+Pj4gSnVzdCB0aGF0IHRo
ZSBwb3J0IGFjY2Vzc2VzIHRoZW4gd291bGRuJ3Qgd29yayAocG9zc2libHkgY3Jhc2hpbmcNCj4+
PiB0aGUgZ3Vlc3QsIG9yIG1ha2luZyBpdCBvdGhlcndpc2UgbWlzYmVoYXZlKS4NCj4+IA0KPj4g
QXMgRUNBTSBhbmQgQXJtIGRvZXMgbm90IHN1cHBvcnQgSS9PIHBvcnRzLCBhIGRyaXZlciByZXF1
ZXN0aW5nIGFjY2Vzcw0KPj4gdG8gdGhlbSB3b3VsZCBnZXQgYW4gZXJyb3IgYmFjay4NCj4+IFNv
IGluIHByYWN0aWNlIGl0IGlzIG5vdCBwb3NzaWJsZSB0byB0cnkgdG8gYWNjZXNzIHRoZSBpb3Bv
cnRzIGFzIHRoZXJlIGlzIG5vDQo+PiB3YXkgb24gYXJtIHRvIHVzZSB0aGVtIChubyBpbnN0cnVj
dGlvbnMpLg0KPj4gDQo+PiBBIGRyaXZlciBjb3VsZCBtaXNiZWhhdmUgYnkgaWdub3JpbmcgdGhl
IGZhY3QgdGhhdCBpb3BvcnRzIGFyZSBub3QgdGhlcmUgYnV0DQo+PiBJIGFtIG5vdCBxdWl0ZSBz
dXJlIGhvdyB3ZSBjb3VsZCBzb2x2ZSB0aGF0IGFzIGl0IHdvdWxkIGJlIGEgYnVnIGluIHRoZSBk
cml2ZXIuDQo+IA0KPiBUaGUgbWluaW1hbCB0aGluZyBJJ2Qgc3VnZ2VzdCAob3IgbWF5YmUgeW91
J3JlIGRvaW5nIHRoaXMgYWxyZWFkeSkNCj4gd291bGQgYmUgdG8gZXhwb3NlIHN1Y2ggQkFScyB0
byB0aGUgZ3Vlc3QgYXMgci9vIHplcm8sIHJhdGhlciB0aGFuDQo+IGxldHRpbmcgdGhlaXIgcG9y
dCBuYXR1cmUgInNoaW5lIHRocm91Z2giLg0KDQpXZSBhcmUgZW11bGF0aW5nIGFuIEVDQU0gUENJ
IHdoaWNoIGRvZXMgbm90IHN1cHBvcnQgSS9PIHBvcnRzIHNvIEkgZG8gbm90DQp0aGluayB3ZSBh
cmUgKGFuZCBjYW4pIGV4cG9zZSB0aG9zZSB0byBndWVzdHMuDQoNCkFueXdheSBJIHdpbGwgbWFy
ayB0aGlzIGFzIGEgcG9pbnQgdG8gY2hlY2sgZm9yIFJhaHVsIHdoZW4gaGUgaXMgYmFjay4NCg0K
Q2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBKYW4NCg0K

