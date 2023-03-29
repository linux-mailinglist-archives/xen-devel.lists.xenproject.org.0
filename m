Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0344D6CDC9A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 16:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516296.800203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWs8-0003S0-6Y; Wed, 29 Mar 2023 14:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516296.800203; Wed, 29 Mar 2023 14:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWs8-0003Pz-3U; Wed, 29 Mar 2023 14:33:56 +0000
Received: by outflank-mailman (input) for mailman id 516296;
 Wed, 29 Mar 2023 14:33:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTc=7V=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1phWs6-0003Pt-At
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 14:33:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b810e5ee-ce3e-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 16:33:49 +0200 (CEST)
Received: from AS9PR06CA0162.eurprd06.prod.outlook.com (2603:10a6:20b:45c::31)
 by DU0PR08MB9420.eurprd08.prod.outlook.com (2603:10a6:10:423::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 14:33:38 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::f6) by AS9PR06CA0162.outlook.office365.com
 (2603:10a6:20b:45c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Wed, 29 Mar 2023 14:33:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.9 via Frontend Transport; Wed, 29 Mar 2023 14:33:38 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 29 Mar 2023 14:33:38 +0000
Received: from 4c62fec2e42f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0DABEBE-0DBA-410A-B085-388E81098274.1; 
 Wed, 29 Mar 2023 14:33:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c62fec2e42f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Mar 2023 14:33:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB8PR08MB5372.eurprd08.prod.outlook.com (2603:10a6:10:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 14:33:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 14:33:30 +0000
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
X-Inumbo-ID: b810e5ee-ce3e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkx2eg6gYLHAn1XB40x+OvCOhM+/Td4YWhdLWp5eA/0=;
 b=vRwAiV0eeBCdt1drMsOaAST/NKr2n2hVA2yu84gMWJfgflz4PNBNP/vxv4ozR3WF4+n0KrxVvKYWcgM8Ep+fCAKzSrc4fjgFrTYnE0f9MJEZkQF5/NJ8rG1Hh3/L565IoDiYRHhNvbCKeW+IJQiFE/lyP9rU5BPppOweuWj3wMI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4bd79f0f5d0f9d4b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbUL3aVKdOfp+ukNNFNgIfJ6haWQZyDMH1IH+F68kMWEp2n3RKkJ2NQ0tp6EDsJczTLA7ilhzERajnyPqgNm7Xfq8aypCUk8fig7VpaiDu2gKqWnyjgBq7skYp4u1/lpZguRvZH0rvS+RneRuM+HwWATzKWSD256+oDI05km5tgN/zTji/zEyd8VvuQIODhf4s86+1XB97X9Vr0qst6FAMQMXlD8Ir5w6FQ1qF1GrQ0U2rY7C8LAJYhwvxeiqRkQBskG5oTgub58jiOMC7zRV3TctEQsQfuLnn+2d2kLgGp88dJmNNIoa8hey0MGeoScu5wSpCAq3VljFIl7xf29xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkx2eg6gYLHAn1XB40x+OvCOhM+/Td4YWhdLWp5eA/0=;
 b=RbeGE0z/w7jfIyqBeVMG3SK2o5TvpEPWH2ZP1v6LzlZF9JYB6DYdMVRZ8+urBqfnG1PDvQC9T6Fin5brsY0FkeEqa75V1AMWS8wN322D6MqCy6CdL+ZDIJrrmMbMp3/qtX3BKxnsR2lmQTf+Iy11SxY5V7u+9KE6TQzfis32pPQjtwY8k0FZucor09TRwzsCDAZ6F1jTPcTD9l9QuzqOMlHsP9mz4wWbzhzDzdQ2KTY3MFaJ9zsoSiCQ848Z6CUoO6wP62jpTa5H6f5FSF55L8Vc4f5tWMdK+NnuwztoP7q1m0qphGmNC2IsGtjWQujGd2xcqI6etyhdPMwE8wAesA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkx2eg6gYLHAn1XB40x+OvCOhM+/Td4YWhdLWp5eA/0=;
 b=vRwAiV0eeBCdt1drMsOaAST/NKr2n2hVA2yu84gMWJfgflz4PNBNP/vxv4ozR3WF4+n0KrxVvKYWcgM8Ep+fCAKzSrc4fjgFrTYnE0f9MJEZkQF5/NJ8rG1Hh3/L565IoDiYRHhNvbCKeW+IJQiFE/lyP9rU5BPppOweuWj3wMI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v4 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZYJtnVirGlcet3UaNyqwRESxZda8P+VUAgAGzKoCAAAUrgIAAI/AA
Date: Wed, 29 Mar 2023 14:33:30 +0000
Message-ID: <BF65C0DA-1B2D-4711-9AF1-F290B7B513EE@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-8-luca.fancellu@arm.com>
 <2846794b-8057-2f41-3082-4d6c6fcd3f50@suse.com>
 <B3F6542B-B6AC-47F1-A273-CC2E0F347E59@arm.com>
 <6f1ac2d6-b772-e25b-7170-5de896aed612@suse.com>
In-Reply-To: <6f1ac2d6-b772-e25b-7170-5de896aed612@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB8PR08MB5372:EE_|AM7EUR03FT045:EE_|DU0PR08MB9420:EE_
X-MS-Office365-Filtering-Correlation-Id: 53081f11-8744-468c-459a-08db306295ff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rsxyPhCzx0q/HcY0IekKJjzs+ECLjairSBNAMDWmdR6fjLyq5UyXm5zWxaojEEILXvVNAK+PdQ7MYDVFjUk990tXuoAseQ3YWWuIZ+JmJfyc9fk+pIvnzEoRH56NiNpkMOJdFfYw7W1bHULQRTKzt9bI1dOCzrKJmvffJCavyRsWVPTE8/XLfiwIQo1IdZJmjMIYMFB9zHpuLMk7IlW97u7y737VW8FELdomoAmIGaNDG4ilpBcxBN1K1/B7MUvjy2zA9XPB/qlFzw+IHMalhJlFPJizrnnxFNLZ7CpTgHtECvvc4EYCRqFRwSvDVAObcbdYDSwHvlCvO3CBb1uvaNCuzcoiUudTPPPwqiZenCp1g+zmYqLh1xnimp0tIkBxYqoSGlqCv+Egz9NDO1luItOyQQGz0YuWfDhl9KZOGgRMRFJxcBM7OfgjHR9G9fC/Ehb2q1zyeUZ6Kh8ZUHu1bFmWp9udqntv764IZC5/PUCz/IRFWIhYEm45QqSn/9JqWUCMU80m5Wl/WQ/YTIX5Zd1qAmjgJVG55slX7KWdf2zOqqfnE7n7tZDfhkQLgaLdI6104twpG47HHLqxWhTcBsBTWbNQg6LaiQso5ClPOGF0y8xUJ2BE7Fxo1azspYtg2R7aBBe0nEFqJZ2iRCDRGg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199021)(54906003)(6512007)(6506007)(2616005)(53546011)(26005)(478600001)(186003)(91956017)(76116006)(4326008)(6916009)(316002)(71200400001)(66556008)(6486002)(8676002)(66476007)(66946007)(66446008)(64756008)(83380400001)(38100700002)(41300700001)(5660300002)(8936002)(2906002)(122000001)(38070700005)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C119545DB5411D418675E291CFCC63C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5372
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	29d32248-c678-4412-6251-08db30629105
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oeI8QiN6XS8NhqWUZ7r/TgqdK0IgEu+8D25+UUoNLm0E+tE2sYI/LVTPCyhs6fRoubLMGtwVJCTlecS8RDCqIwCC1RZU725ORMrOjHHs9bdFKq+BkoAKcXxC91OwaWgFd1B74j6voxYLYPAkQXCSXcUFpvjZTxB2J8MhdwQRn21THmvJKLT1iJwxZr982KzUAY9R80x85OV/8EfClJGI9ULQYTzcX4CiTVTjpCslKTgr3LecC6lXZ8jdpeK9ZjrLvhEctgg+0piReajpLLeb6Ed5+ZxwIr/YFxc8qcmjzncXpUI+2HvX3dwhKwLd2JfCDrxHheC+2ZvIzJYbb1351Kkkgr1sa/FDeGsWFasFkL2/UjzVY5pyb0uYpkwyX7HhFSy7jl7biYDaIh963kT5sKyF37CPX0v4/oMKCHLPtY9IXagMoWm311yD7cuXTM2FlHfxhZ2BJ15YRPaQPbExaIwFMYkqj/ZJL3Ehhi4cRdu2FeffUaNcHr6SDKhN8F7v/aycnGPLRKozeL88LfnY0/6gFE3qnbigc+uKUCFXMA+5lnVoD/FZ922WvKLBWsuVsZYH7wIkO03gg4odJcxx7sBL04eBZ+eWIBVNjtc3oHvLQr9lcL9/3LDnxs4LEnd1mN0jZ2H8XVYOqSwNLLKfT2r9enyWW+TbhO+SGPr+waktfAasNv/2eCQIu1Q0QxHsKqGParbawGs9Ef1VXwnMiQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(2616005)(53546011)(54906003)(316002)(83380400001)(336012)(6512007)(186003)(6506007)(26005)(47076005)(6486002)(40460700003)(6862004)(86362001)(40480700001)(33656002)(82310400005)(36756003)(81166007)(478600001)(5660300002)(8936002)(356005)(82740400003)(70586007)(70206006)(4326008)(8676002)(41300700001)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 14:33:38.3895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53081f11-8744-468c-459a-08db306295ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9420

DQoNCj4gT24gMjkgTWFyIDIwMjMsIGF0IDEzOjI0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjkuMDMuMjAyMyAxNDowNiwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+Pj4gQEAgLTYxLDcgKzYyLDEyIEBAIGN1c3RvbV9wYXJhbSgiZG9tMF9tZW0iLCBw
YXJzZV9kb20wX21lbSk7DQo+Pj4+IA0KPj4+PiBpbnQgX19pbml0IHBhcnNlX2FyY2hfZG9tMF9w
YXJhbShjb25zdCBjaGFyICpzdHJfYmVnaW4sIGNvbnN0IGNoYXIgKnN0cl9lbmQpDQo+Pj4+IHsN
Cj4+Pj4gLSAgICByZXR1cm4gLTE7DQo+Pj4+ICsgICAgaW50IHJjID0gMDsNCj4+Pj4gKw0KPj4+
PiArICAgIGlmICggc3ZlX3BhcnNlX2RvbTBfcGFyYW0oc3RyX2JlZ2luLCBzdHJfZW5kKSA8IDAg
KQ0KPj4+PiArICAgICAgICByYyA9IC1FSU5WQUw7DQo+Pj4gDQo+Pj4gLi4uIGNhbid0IHlvdSBj
YWxsIHBhcnNlX2ludGVnZXIoKSByaWdodCBoZXJlPyBvcHRfZG9tMF9zdmUgaXNuJ3Qgc3RhdGlj
LA0KPj4+IHNvIG91Z2h0IHRvIGJlIGFjY2Vzc2libGUgaGVyZSAocHJvdmlkZWQgdGhlIG5lY2Vz
c2FyeSBoZWFkZXIgd2FzIGluY2x1ZGVkKS4NCj4+PiANCj4+IA0KPj4gT2ggb2sgbm93IEnigJl2
ZSBzZWVuIHdoeSBJ4oCZbSBkb2luZyB0aGlzLCBiZWNhdXNlIG9wc19kb20wX3N2ZSBpcyBjb21w
aWxlZCBvbmx5DQo+PiB3aGVuIENPTkZJR19BUk02NF9TVkUgaXMgZW5hYmxlZCwgc28gSeKAmW0g
dXNpbmcgc3ZlX3BhcnNlX2RvbTBfcGFyYW0oKQ0KPj4gdGhhdCByZXR1cm5zIG5lZ2F0aXZlIGlm
IHRoYXQgb3B0aW9uIGlzIG5vdCBlbmFibGVkLg0KPj4gDQo+PiBPdGhlcndpc2UgSSBzaG91bGQg
ZGVjbGFyZSBvcHNfZG9tMF9zdmUgYW55d2F5LCBidXQgSSBzaG91bGQgbm90IGFjY2VwdCB1c2Vy
DQo+PiBjdXN0b21pemF0aW9uIG9mIGl0IGlmIHRoZSBvcHRpb24gaXMgbm90IGVuYWJsZWQuDQo+
PiANCj4+IFNvIEkgdGhvdWdodCB0aGUgdXNlIG9mIHN2ZV9wYXJzZV9kb20wX3BhcmFtKCkgd2Fz
IHRoZSBiZXN0IHdheSB0byBoYW5kbGUgdGhhdA0KPiANCj4gTWF5YmUuIEJ1dCBwbGVhc2UgYWxz
byBwYXkgYXR0ZW50aW9uIHRvIHRoZSBleGlzdGVuY2Ugb2Ygbm9fY29uZmlnX3BhcmFtKCkNCj4g
KGFzIGluOiBjb25zaWRlciB1c2luZyBpdCBoZXJlLCB3aGljaCB3b3VsZCByZXF1aXJlIHRoZSBj
b2RlIHRvIGxpdmUgb3V0c2lkZQ0KPiBvZiBzdmUuYykuDQoNClRoYW5rIHlvdSwgSSBkaWRu4oCZ
dCBrbm93IHRoZSBleGlzdGVuY2Ugb2Ygbm9fY29uZmlnX3BhcmFtKCksIEnigJl2ZSBoYWQgYSBs
b29rIG9uIHRoZQ0KYXBwcm9hY2gsIGZvciBleGFtcGxlIGluIHN0YXRpYyBpbnQgX19pbml0IGNm
X2NoZWNrIHBhcnNlX2NldChjb25zdCBjaGFyICpzKSwgYW5kIEnigJlsbCBkbw0Kc29tZXRoaW5n
IHNpbWlsYXINCg0KPiANCj4gSmFuDQoNCg==

