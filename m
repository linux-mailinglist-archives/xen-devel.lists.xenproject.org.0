Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67E783C32
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 10:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588281.919796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYNAA-0004ra-E6; Tue, 22 Aug 2023 08:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588281.919796; Tue, 22 Aug 2023 08:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYNAA-0004or-Ae; Tue, 22 Aug 2023 08:54:58 +0000
Received: by outflank-mailman (input) for mailman id 588281;
 Tue, 22 Aug 2023 08:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hUC=EH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qYNA9-0004ol-DP
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 08:54:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 906bf0dc-40c9-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 10:54:55 +0200 (CEST)
Received: from AS9PR06CA0349.eurprd06.prod.outlook.com (2603:10a6:20b:466::24)
 by AM8PR08MB5842.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:54:52 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::d) by AS9PR06CA0349.outlook.office365.com
 (2603:10a6:20b:466::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:54:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Tue, 22 Aug 2023 08:54:51 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Tue, 22 Aug 2023 08:54:51 +0000
Received: from 43111b7e0bad.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B0BB285-A697-4D16-88A3-2843771AF72D.1; 
 Tue, 22 Aug 2023 08:54:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43111b7e0bad.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Aug 2023 08:54:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB8196.eurprd08.prod.outlook.com (2603:10a6:150:7c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:54:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:54:37 +0000
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
X-Inumbo-ID: 906bf0dc-40c9-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1IU4sh8/CsRI3M3MS7RVasmjwTq6WStyqHwtlmO85U=;
 b=9uC1J3BRdfGez+pyBmsvRR+u7FtZCtq/Lp/PQx4WH6p7TebanmaPRTBEgkRP3mQE5Xy/Nrvmstpx4YVbPfJStMTexbBINANdQ/yiRfgWnnjVmSg3tMFKh0pp2Oo5f45DYXmR5ZuxpCH7vNqDGi+1E27oqOsxYu7iTUGUR7DEZ18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25170a65e82d0a16
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSimtJd0pGr1CDM10eGFNEXd39WgU4azi5ApbBaeGb2y2kSa/ihGyYeQtdTkKYLO+ViirLq+lLrHjNhZxvJcKPzYV8VDsHKagAkzhCJn7c0G/4JfYsdwSWk4PdxYA/K8ByOZu0Ix7KTy8PdQgCyeZ+tj5KH1JVpx85rEB99kP9nZ1EsqjshYZO+A95APlEyjrymkLWCQsfcOMy2Nlk+HaDppBCv8JgvL4GQlw8ABHZPBQj3mrN0FKBCPLdUAWUb2esVdcbojZ7MPosfo+uUNMxNk42UqyNzSnwTTo6ryRUYm070XhT3wFd4YGu6ipIi7e1k80xQgMSbwwC/w7Culfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1IU4sh8/CsRI3M3MS7RVasmjwTq6WStyqHwtlmO85U=;
 b=T/CTJDCxxkysA/HsWVoNlnyt/DuNbOJk+dhOCvPpW3Zl+Iviigh0uYEpAbXNE468WShdbOVMRgGGxal7NJtuvO8Zcj8Pwsm5i1ud5s6qSW5qGbjewAY0SUXTjMuLB/FMqrR7w72P7yyzfl2ldOb4lwovosvNnuLtQPO41LMmJWU+jX4DEY1BhFOCDfulv9SuT9sFUj7M1NQCpz9alE/CG/XUv2vbT7hzRwCPhI5d0aC8IjdcR05YU8J/8hXSrchKW/mRivxY6eBgDM4clUvq+DjR5XO144pQAol7EHahSR1Hue4q1+EadJSYHrPyO4PoJ0ELnQvS9grNTPIo7gSSVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1IU4sh8/CsRI3M3MS7RVasmjwTq6WStyqHwtlmO85U=;
 b=9uC1J3BRdfGez+pyBmsvRR+u7FtZCtq/Lp/PQx4WH6p7TebanmaPRTBEgkRP3mQE5Xy/Nrvmstpx4YVbPfJStMTexbBINANdQ/yiRfgWnnjVmSg3tMFKh0pp2Oo5f45DYXmR5ZuxpCH7vNqDGi+1E27oqOsxYu7iTUGUR7DEZ18=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to
 setup.c
Thread-Topic: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to
 setup.c
Thread-Index: AQHZzmeOkWUgiqEb9U2fOmI3mEWP3a/1UMEAgACrQQCAABBYAIAAA1gA
Date: Tue, 22 Aug 2023 08:54:37 +0000
Message-ID: <A4D0D589-6B85-4B0B-B095-C8764F738C1E@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-13-Henry.Wang@arm.com>
 <b9476973-519b-210d-6ca2-ca614d1e1279@xen.org>
 <2FABB940-CFFB-4EA2-8BC5-758E58025EF0@arm.com>
 <82f36b28-9452-4b4b-92ed-8df784cb07b9@xen.org>
In-Reply-To: <82f36b28-9452-4b4b-92ed-8df784cb07b9@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB8196:EE_|AM7EUR03FT033:EE_|AM8PR08MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b19b65-c6f5-4b1f-7d8a-08dba2ed72bd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +54/RcdNePzzUiEY9LOcFEry8lpfhymj667USLBemhayUDPnxeU9qe9hMvQlraGx7D667repYVrxuyn2pH2h6iB1Bs27H/b1QXX1rYC2bmqUIbH58KY4xpE3TUSVN4PRbwArbc6cRhQVe7plChiTl0XBE8sCdelCflpr5Z6cVkbBESJ8kCsWQcf8bT+npm508iHf8GIvpsB/HuGGqPtlqfhugqSD1iCFr6lsMC6SOHHKytEb7B9sn1mzbpUm5CIeo86jPeMADG1iUpiZw7o4zr6MtK3osK0i3TBQL9gOGq83QAv4XaJAUogSQzsIuenueUNgtomN84R8iSIO2+sDsUl+qJqZfTp2tgYSGk2WHjs7nggy+x1gX8D9iC7EK5JfANWMIqpctpbPYYNeuibE/YS6LbGiNQWb0slyU7BdeNxSpQdjDmifzV2OiKxmoQvIXBuoy64iovaB5/AwMc14i+y8LywFjNdOrbU1Dl4LcA4SX/Z+1nK2yGh/NeTzjwRqNAnVUdDHiqmU6oQTVYW1mImHoX5FIyrvrH3Ah1kuOEHlnFPeE3HO2TuYlKmHntOZwcdmWVNER/IjMYO649rbM/MNHD9k+gzZWj5HeHe0E7oAWBgdLc/8fwqzqxQrz2haOpr3qGtGOSmIQ/a1GkH18w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39860400002)(396003)(376002)(1800799009)(451199024)(186009)(91956017)(54906003)(66946007)(66556008)(66476007)(66446008)(64756008)(2906002)(4326008)(8676002)(41300700001)(8936002)(316002)(6916009)(76116006)(478600001)(53546011)(5660300002)(6486002)(6506007)(71200400001)(66899024)(6512007)(2616005)(26005)(83380400001)(38070700005)(122000001)(86362001)(36756003)(38100700002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9968B103717E3C468D6588788EDDBF1B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8196
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25a59bde-1e7d-47bc-30c1-08dba2ed6a41
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TpzrANqa2l8+NIt9uZOuYXGJmxhNW2+KT/iZgLi6FfoEVk4+MLjEJZ18ExTlvKtEnStzszB8zcaJwCn2IeyWtZccj99oIvLAnp3TMZWCQC2sYPFv6XvNuloDuMsHXt70v99YQ5uQu/KdD6baS5/FFRBqpojCndI4csDjglEH66+juBD+GqT5UdmxYqmjcNwqwxwQvpt8TCRntx31UWs/WqKfKbGxxpaD+TJx5qx/LLYVnFmGMZFgdRm/qdy6jKEz5F/4qEGy3/1kowe5XLg010yCH202Fz+dv7XyxlFvy0BWdX+tLc2yrZYP06wj96/wjpQYW71r05kdyvXKgO8nwRQUGi5B+I60dEI/BvmO8Le8ros5ZcJBZzD4QhWjUe2ZaAAKoj4Clwie1c0DHjpdJAKKrdGIuGK3ZcFDM7kjs+WROQaPOLcPr8zj15LusA4l1uXnIF8s76BPKVhBT7KNQWOZoDrMpSOpbxpYgR+pE8LV/lPOr2kvyCMNUW4KEwt5PLyiEPSeDFKnsV68TjamcqMcX0lucHupQS9WUrebbP3ddMh5BJP4r0oz64h2PyzYWT+84BhRNlqiq+7H520/OLOk5/8P+up57f+TPzuUHg0TiWooNUevNzsW61eXm8ke2wSuFUdYrlRL7Ah3kR/MKzsAOMypCjMf1XMvHSRUzS1ixdwzg8HllowUtMPtn4Vo4JS8MTMbCSGU88QB58VYoHkSi4pXxhF4wL8kK+2cZJ4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(1800799009)(186009)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(54906003)(70206006)(70586007)(316002)(6512007)(66899024)(8676002)(8936002)(2616005)(6862004)(4326008)(40460700003)(36756003)(41300700001)(82740400003)(356005)(81166007)(478600001)(53546011)(6506007)(6486002)(40480700001)(83380400001)(2906002)(86362001)(47076005)(36860700001)(336012)(5660300002)(26005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:54:51.7308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b19b65-c6f5-4b1f-7d8a-08dba2ed72bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5842

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyAyMiwgMjAyMywgYXQgMTY6NDIsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gT24gMjIvMDgvMjAyMyAwODo0NCwgSGVucnkg
V2FuZyB3cm90ZToNCj4+PiBPbiBBdWcgMjIsIDIwMjMsIGF0IDA1OjMxLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSwNCj4+PiANCj4+PiBPbiAxNC8w
OC8yMDIzIDA1OjI1LCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4+PiBGcm9tOiBQZW5ueSBaaGVuZyA8
UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4+Pj4gRnVuY3Rpb24gY29weV9mcm9tX3BhZGRyKCkgaXMg
ZGVmaW5lZCBpbiBhc20vc2V0dXAuaCwgc28gaXQgaXMgYmV0dGVyDQo+Pj4+IHRvIGJlIGltcGxl
bWVudGVkIGluIHNldHVwLmMuDQo+Pj4gDQo+Pj4gSSBkb24ndCBhZ3JlZSB3aXRoIHRoaXMgcmVh
c29uaW5nLiBXZSB1c2VkIHNldHVwLmggdG8gZGVjbGFyZSBwcm90b3R5cGUgZm9yIGZ1bmN0aW9u
IHRoYXQgYXJlIG91dCBvZiBzZXR1cC5jLg0KPj4+IA0KPj4+IExvb2tpbmcgYXQgdGhlIG92ZXJh
bGwgb2YgdGhpcyBzZXJpZXMsIGl0IGlzIHVuY2xlYXIgdG8gbWUgd2hhdCBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIG1tdS9tbS5jIGFuZCBtbXUvc2V0dXAuYy4gSSBrbm93IHRoaXMgaXMgdGVj
aG5pY2FsbHkgbm90IGEgbmV3IHByb2JsZW0gYnV0IGFzIHdlIHNwbGl0IHRoZSBjb2RlLCBpdCB3
b3VsZCBiZSBhIGdvb2Qgb3Bwb3J0dW5pdHkgdG8gaGF2ZSBhIGJldHRlciBzcGxpdC4NCj4+PiAN
Cj4+PiBGb3IgaW5zdGFuY2UsIHdlIGhhdmUgc2V0dXBfbW0oKSBkZWZpbmVkIGluIHNldHVwLmMg
YnV0IHNldHVwX3BhZ2V0YWJsZXMoKSBhbmQgbW0uYy4gQm90aCBhcmUgdGVjaG5pY2FsbHkgcmVs
YXRlZCB0byB0aGUgbWVtb3J5IG1hbmFnZW1lbnQuIFNvIGhhdmluZyB0aGVtIGluIHNlcGFyYXRl
IGZpbGUgaXMgYSBiaXQgb2RkLg0KPj4gU2tpbW1pbmcgdGhyb3VnaCB0aGUgY29tbWVudHMsIGl0
IGxvb2tzIGxpa2Ugd2UgaGF2ZSBhIGNvbW1vbiBwcm9ibGVtDQo+PiBpbiBwYXRjaCA3LCA5LCAx
MCwgMTIgYWJvdXQgaG93IHRvIG1vdmUvc3BsaXQgdGhlIGNvZGUuIFNvIGluc3RlYWQgb2YgaGF2
aW5nDQo+PiB0aGUgZGlzY3Vzc2lvbiBpbiBlYWNoIHBhdGNoLCBJIHdvdWxkIGxpa2UgdG8gcHJv
cG9zZSB0aGF0IHdlIGNhbiBkaXNjdXNzIGFsbA0KPj4gb2YgdGhlc2UgaW4gYSBjb21tb24gcGxh
Y2UgaGVyZS4NCj4gDQo+ICsxLg0KPiANCj4+PiANCj4+PiBJIGFsc28gZG9uJ3QgbGlrZSB0aGUg
aWRlYSBvZiBoYXZpbmcgYWdhaW4gYSBtYXNzaXZlIG1tLmMgZmlsZXMuIFNvIG1heWJlIHdlIG5l
ZWQgYSBzcGxpdCBsaWtlOg0KPj4+ICAqIEZpbGUgMTogQm9vdCBDUFUwIE1NIGJyaW5ndXAgKG1t
dS9zZXR1cC5jKQ0KPj4+ICAqIEZpbGUgMjogU2Vjb25kYXJ5IENQVXMgTU0gYnJpbmd1cCAobW11
L3NtcGJvb3QuYykNCj4+PiAgKiBGaWxlIDM6IFBhZ2UgdGFibGVzIHVwZGF0ZS4gKG1tdS9wdC5j
KQ0KPj4+IA0KPj4+IElkZWFsbHkgZmlsZSAxIHNob3VsZCBjb250YWluIG9ubHkgaW5pdCBjb2Rl
L2RhdGEgc28gaXQgY2FuIGJlIG1hcmtlZCBhcyAuaW5pdC4gU28gdGhlIHN0YXRpYyBwYWdldGFi
bGVzIG1heSB3YW50IHRvIGJlIGRlZmluZWQgaW4gbW11L3B0LmMuDQo+PiBTbyBiYXNlZCBvbiBK
dWxpZW7igJlzIHN1Z2dlc3Rpb24sIFBlbm55IGFuZCBJIHdvcmtlZCBhIGJpdCBvbiB0aGUgY3Vy
cmVudA0KPj4gZnVuY3Rpb25zIGluIOKAnGFyY2gvYXJtL21tLmPigJ0gYW5kIHdlIHdvdWxkIGxp
a2UgdG8gcHJvcG9zZSBiZWxvdyBzcGxpdA0KPj4gc2NoZW1lLCB3b3VsZCB5b3UgcGxlYXNlIGNv
bW1lbnQgb24gaWYgYmVsb3cgbWFrZXMgc2Vuc2UgdG8geW91LA0KPj4gdGhhbmtzIQ0KPj4gIiIi
DQo+PiBzdGF0aWMgdm9pZCBfX2luaXQgX19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9ucygp
ICAgICAgLT4gYXJjaC9hcm0vbW0uYw0KPiANCj4gQWxsIHRoZSBleGlzdGluZyBidWlsZCBhc3Nl
cnRpb25zIHNlZW1zIHRvIGJlIE1NVSBzcGVjaWZpYy4gU28gc2hvdWxkbid0IHRoZXkgYmUgbW92
ZWQgdG8gbW11L21tLmMuDQo+IA0KPj4gc3RhdGljIGxwYWVfdCAqeGVuX21hcF90YWJsZSgpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQo+PiBzdGF0aWMgdm9pZCB4ZW5f
dW5tYXBfdGFibGUoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3B0LmMNCj4+
IHZvaWQgZHVtcF9wdF93YWxrKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtPiBtbXUvcHQuYw0KPj4gdm9pZCBkdW1wX2h5cF93YWxrKCkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQo+PiBscGFlX3QgbWZuX3RvX3hlbl9lbnRy
eSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3B0LmMNCj4+IHZvaWQg
c2V0X2ZpeG1hcCgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBt
bXUvcHQuYw0KPj4gdm9pZCBjbGVhcl9maXhtYXAoKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQo+PiB2b2lkIGZsdXNoX3BhZ2VfdG9fcmFtKCkgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXJjaC9hcm0vbW0uYz8NCj4gDQo+IEkg
dGhpbmsgaXQgc2hvdWxkIHN0YXkgaW4gYXJjaC9hcm0vbW0uYyBiZWNhdXNlIHlvdSB3aWxsIHBy
b2JhYmx5IG5lZWQgdG8gY2xlYW4gYSBwYWdlIGV2ZW4gb24gTVBVIHN5c3RlbXMuDQo+IA0KPj4g
bHBhZV90IHB0ZV9vZl94ZW5hZGRyKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0+IG1tdS9wdC5jDQo+PiB2b2lkICogX19pbml0IGVhcmx5X2ZkdF9tYXAoKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLT4gbW11L3NldHVwLmMNCj4+IHZvaWQgX19pbml0IHJlbW92ZV9l
YXJseV9tYXBwaW5ncygpICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUvc2V0dXAuYw0KPj4g
c3RhdGljIHZvaWQgeGVuX3B0X2VuZm9yY2Vfd254KCkgICAgICAgICAgICAgICAgICAgICAgICAg
IC0+IG1tdS9wdC5jLCBleHBvcnQgaXQNCj4gDQo+IEFGQUlVLCBpdCB3b3VsZCBiZSBjYWxsZWQg
ZnJvbSBzbXBib290LmMgYW5kIHNldHVwLmMuIEZvciB0aGUgZm9ybWVyLCB0aGUgY2FsbGVyIGlz
IG1tdV9pbml0X3NlY29uZGFyeV9jcHUoKSB3aGljaCBJIHRoaW5rIGNhbiBiZSBmb2xkZWQgaW4g
aGVhZC5TLg0KPiANCj4gSWYgd2UgZG8gdGhhdCwgdGhlbiB4ZW5fcHRfZW5mb3JjZV93bngoKSBj
YW4gYmUgbW92ZWQgaW4gc2V0dXAuYyBhbmQgZG9lc24ndCBuZWVkIHRvIGJlIGV4cG9ydGVkLg0K
PiANCj4+IHN0YXRpYyB2b2lkIGNsZWFyX3RhYmxlKCkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtPiBtbXUvc21wYm9vdC5jDQo+PiB2b2lkIF9faW5pdCBzZXR1cF9wYWdldGFibGVz
KCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3NldHVwLmMNCj4+IHN0YXRpYyB2
b2lkIGNsZWFyX2Jvb3RfcGFnZXRhYmxlcygpICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUv
c21wYm9vdC5jDQo+PiBpbnQgaW5pdF9zZWNvbmRhcnlfcGFnZXRhYmxlcygpICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLT4gbW11L3NtcGJvb3QuYw0KPj4gdm9pZCBtbXVfaW5pdF9zZWNvbmRh
cnlfY3B1KCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9zbXBib290LmMNCj4+
IHZvaWQgX19pbml0IHNldHVwX2RpcmVjdG1hcF9tYXBwaW5ncygpICAgICAgICAgICAgICAgICAg
ICAtPiBtbXUvc2V0dXAuYw0KPj4gdm9pZCBfX2luaXQgc2V0dXBfZnJhbWV0YWJsZV9tYXBwaW5n
cygpICAgICAgICAgICAgICAgICAgIC0+IG1tdS9zZXR1cC5jDQo+PiB2b2lkICpfX2luaXQgYXJj
aF92bWFwX3ZpcnRfZW5kKCkgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXJjaC9hcm0vbW0u
YyBvciBtbXUvc2V0dXAuYz8NCj4gDQo+IEFGQUlVLCB0aGUgVk1BUCB3aWxsIG5vdCBiZSB1c2Vk
IGZvciBNUFUgc3lzdGVtcy4gU28gdGhpcyB3b3VsZCB3YW50IHRvIGdvIGluIG1tdS8uIEkgYW0g
b2sgd2l0aCBzZXR1cC5jLg0KPiANCj4+IHZvaWQgKmlvcmVtYXBfYXR0cigpICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUvcHQuYw0KPj4gdm9pZCAqaW9yZW1hcCgp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQo+
PiBzdGF0aWMgaW50IGNyZWF0ZV94ZW5fdGFibGUoKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLT4gbW11L3B0LmMNCj4+IHN0YXRpYyBpbnQgeGVuX3B0X25leHRfbGV2ZWwoKSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtPiBtbXUvcHQuYw0KPj4gc3RhdGljIGJvb2wgeGVuX3B0X2No
ZWNrX2VudHJ5KCkgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQo+PiBzdGF0
aWMgaW50IHhlbl9wdF91cGRhdGVfZW50cnkoKSAgICAgICAgICAgICAgICAgICAgICAgICAgLT4g
bW11L3B0LmMNCj4+IHN0YXRpYyBpbnQgeGVuX3B0X21hcHBpbmdfbGV2ZWwoKSAgICAgICAgICAg
ICAgICAgICAgICAgICAtPiBtbXUvcHQuYw0KPj4gc3RhdGljIHVuc2lnbmVkIGludCB4ZW5fcHRf
Y2hlY2tfY29udGlnKCkgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQo+PiBzdGF0aWMgaW50
IHhlbl9wdF91cGRhdGUoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3B0
LmMNCj4+IGludCBtYXBfcGFnZXNfdG9feGVuKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtPiBtbXUvcHQuYw0KPj4gaW50IF9faW5pdCBwb3B1bGF0ZV9wdF9yYW5nZSgpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQo+PiBpbnQgZGVzdHJveV94ZW5f
bWFwcGluZ3MoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3B0LmMNCj4+
IGludCBtb2RpZnlfeGVuX21hcHBpbmdzKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtPiBtbXUvcHQuYw0KPj4gdm9pZCBmcmVlX2luaXRfbWVtb3J5KCkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0+IG1tdS9zZXR1cC5jDQo+PiB2b2lkIGFyY2hfZHVtcF9zaGFy
ZWRfbWVtX2luZm8oKSAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXJjaC9hcm0vbW0uYw0K
Pj4gaW50IHN0ZWFsX3BhZ2UoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0+IGFyY2gvYXJtL21tLmMNCj4+IGludCBwYWdlX2lzX3JhbV90eXBlKCkgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBhcmNoL2FybS9tbS5jDQo+PiB1bnNpZ25lZCBs
b25nIGRvbWFpbl9nZXRfbWF4aW11bV9ncGZuKCkgICAgICAgICAgICAgICAgICAgLT4gYXJjaC9h
cm0vbW0uYw0KPj4gdm9pZCBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KCkgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0+IGFyY2gvYXJtL21tLmMNCj4+IGludCB4ZW5tZW1fYWRkX3RvX3BoeXNt
YXBfb25lKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBhcmNoL2FybS9tbS5jDQo+PiBs
b25nIGFyY2hfbWVtb3J5X29wKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LT4gYXJjaC9hcm0vbW0uYw0KPj4gc3RhdGljIHN0cnVjdCBkb21haW4gKnBhZ2VfZ2V0X293bmVy
X2FuZF9ucl9yZWZlcmVuY2UoKSAgIC0+IGFyY2gvYXJtL21tLmMNCj4+IHN0cnVjdCBkb21haW4g
KnBhZ2VfZ2V0X293bmVyX2FuZF9yZWZlcmVuY2UoKSAgICAgICAgICAgICAtPiBhcmNoL2FybS9t
bS5jDQo+PiB2b2lkIHB1dF9wYWdlX25yKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLT4gYXJjaC9hcm0vbW0uYw0KPj4gdm9pZCBwdXRfcGFnZSgpICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IGFyY2gvYXJtL21tLmMNCj4+IGJvb2wg
Z2V0X3BhZ2VfbnIoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBh
cmNoL2FybS9tbS5jDQo+PiBib29sIGdldF9wYWdlKCkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLT4gYXJjaC9hcm0vbW0uYw0KPj4gaW50IGdldF9wYWdlX3R5cGUo
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IGFyY2gvYXJtL21tLmMN
Cj4+IHZvaWQgcHV0X3BhZ2VfdHlwZSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtPiBhcmNoL2FybS9tbS5jDQo+PiBpbnQgY3JlYXRlX2dyYW50X2hvc3RfbWFwcGluZygp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXJjaC9hcm0vbW0uYw0KPj4gaW50IHJlcGxh
Y2VfZ3JhbnRfaG9zdF9tYXBwaW5nKCkgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IGFyY2gv
YXJtL21tLmMNCj4+IGJvb2wgaXNfaW9tZW1fcGFnZSgpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtPiBhcmNoL2FybS9tbS5jDQo+PiB2b2lkIGNsZWFyX2FuZF9jbGVhbl9w
YWdlKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXJjaC9hcm0vbW0uYw0KPj4g
dW5zaWduZWQgbG9uZyBnZXRfdXBwZXJfbWZuX2JvdW5kKCkgICAgICAgICAgICAgICAgICAgICAg
IC0+IGFyY2gvYXJtL21tLmMNCj4+ICIiIg0KPiANCj4gVGhlIHBsYWNlbWVudCBvZiBhbGwgdGhl
IG9uZXMgSSBkaWRuJ3QgY29tbWVudCBvbiBsb29rIGZpbmUgdG8gbWUuIEl0IHdvdWxkIGJlIGdv
b2QgdG8gaGF2ZSBhIHNlY29uZCBvcGluaW9uIGZyb20gZWl0aGVyIEJlcnRyYW5kIG9yIFN0ZWZh
bm8gYmVmb3JlIHlvdSBzdGFydCBtb3ZpbmcgdGhlIGZ1bmN0aW9ucy4NCg0KSSBhZ3JlZSB0byBh
bGwgeW91ciBhYm92ZSBjb21tZW50cywgYW5kIHN1cmUgSSBjYW4gd2FpdCBmb3IgYSBmZXcgZGF5
cyBmb3Igb3RoZXINCm1haW50YWluZXJzIG9waW5pb24gYmVmb3JlIHN0YXJ0IG1vdmluZyB0aGUg
Y29kZS4NCg0KPiANCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbXUvc2V0dXAuYyBi
L3hlbi9hcmNoL2FybS9tbXUvc2V0dXAuYw0KPj4+PiBpbmRleCBlMDVjY2EzZjg2Li44ODlhZGE2
Yjg3IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vbW11L3NldHVwLmMNCj4+Pj4gKysr
IGIveGVuL2FyY2gvYXJtL21tdS9zZXR1cC5jDQo+Pj4+IEBAIC0zMjksNiArMzI5LDMzIEBAIHZv
aWQgX19pbml0IHNldHVwX21tKHZvaWQpDQo+Pj4+ICB9DQo+Pj4+ICAjZW5kaWYNCj4+Pj4gICsv
Kg0KPj4+IA0KPj4+IFdoeSBkaWQgdGhlIHNlY29uZCAnKicgZGlzYXBwZWFyPw0KPj4gQWNjb3Jk
aW5nIHRvIHRoZSBDT0RJTkdfU1RZTEUsIHdlIHNob3VsZCB1c2Ugc29tZXRoaW5nIGxpa2UgdGhp
czoNCj4+IC8qDQo+PiAgKiBFeGFtcGxlLCBtdWx0aS1saW5lIGNvbW1lbnQgYmxvY2suDQo+PiAg
Kg0KPj4gICogTm90ZSBiZWdpbm5pbmcgYW5kIGVuZCBtYXJrZXJzIG9uIHNlcGFyYXRlIGxpbmVz
IGFuZCBsZWFkaW5nICcqJy4NCj4+ICAqLw0KPj4gSW5zdGVhZCBvZiAiLyoq4oCdIGluIHRoZSBi
ZWdpbm5pbmcuIEJ1dCBJIHRoaW5rIHlvdSBtYWRlIGEgcG9pbnQsIEkgbmVlZA0KPj4gdG8gbWVu
dGlvbiB0aGF0IEkgdG9vayB0aGUgb3Bwb3J0dW5pdHkgdG8gZml4IHRoZSBjb21tZW50IHN0eWxl
IGluIGNvbW1pdA0KPj4gbWVzc2FnZS4NCj4gDQo+IFdlIGhhdmUgc3RhcnRlZCB0byB1c2UgLyoq
IHdoaWNoIEkgdGhpbmsgaXMgZm9yIERveHlnZW4gKHNlZSB0aGUgUERYIHNlcmllcykuIFNvIEkg
dGhpbmsgdGhlIENPRElOR19TVFlMRSBuZWVkcyB0byBiZSB1cGRhdGVkIHJhdGhlciB0aGFuIHJl
bW92aW5nIHRoZSBleHRyYSAqLg0KDQpBaGhoIHRoYW5rcyBmb3IgdGhlIGNvbnRleHQsIEkgdG90
YWxseSBmb3Jnb3QgdGhlIERveHlnZW7igKZUaGVuIEkgd2lsbCB1c2UNCiIvKirigJ0gaW4gdjYu
DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBK
dWxpZW4gR3JhbGwNCg0K

