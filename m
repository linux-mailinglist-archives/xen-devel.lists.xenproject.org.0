Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7396B7C9215
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 03:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617002.959440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrTUJ-00083G-4R; Sat, 14 Oct 2023 01:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617002.959440; Sat, 14 Oct 2023 01:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrTUJ-00081a-1F; Sat, 14 Oct 2023 01:30:43 +0000
Received: by outflank-mailman (input) for mailman id 617002;
 Sat, 14 Oct 2023 01:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUN7=F4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qrTUI-00081U-5j
 for xen-devel@lists.xenproject.org; Sat, 14 Oct 2023 01:30:42 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48b4d78a-6a31-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 03:30:40 +0200 (CEST)
Received: from AS4P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::12)
 by DB4PR08MB8056.eurprd08.prod.outlook.com (2603:10a6:10:387::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Sat, 14 Oct
 2023 01:30:32 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5db:cafe::9b) by AS4P189CA0021.outlook.office365.com
 (2603:10a6:20b:5db::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Sat, 14 Oct 2023 01:30:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT060.mail.protection.outlook.com (100.127.140.216) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.29 via Frontend Transport; Sat, 14 Oct 2023 01:30:30 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Sat, 14 Oct 2023 01:30:30 +0000
Received: from a38ef03ba29a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA6824C7-F213-4F28-86C7-E3E64EA5ADBD.1; 
 Sat, 14 Oct 2023 01:30:23 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a38ef03ba29a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 14 Oct 2023 01:30:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5615.eurprd08.prod.outlook.com (2603:10a6:800:1b3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Sat, 14 Oct
 2023 01:30:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Sat, 14 Oct 2023
 01:30:21 +0000
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
X-Inumbo-ID: 48b4d78a-6a31-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPR5YLQuD21gt7bgzmHE/AjHWx5JZ6+N61QStTYGmxw=;
 b=JY0zmGQ6Vm8+8caDO59BSrb3Umk1domnSYSNCkMUlx3zD+tRXSom4otbfcQW8/EQMqcWKtSPPfObhY6MYvxDEV19arQD2KkRyFKL6zmPlY+3uDJm6IjuVDXVzccrEuR9cpErw5lOFafcxM4/LqL6s5yHrn5fMejwH4Da8oajE2k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 201eadd1263d5f2e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9TkeNUqGYb3TnkYbvwr+cndZsTQuQizn2KjXsXB2aw2tezSAoyreooOfQXBOLD/j1tvES5Iu9nNe/ey+Phbk5PSHB7FzQcD3MQ5KPu8E8M2H9QaZ+y3z2RcGV7bs+A+flJG0YEnXXykyzAF9HsAQrne640MasjJTS7l8C/T8nexEyqT2LLG1+GeDkjrG+FaqpBFeOpWgxs8cCw2hAlH4mKGedeqwG5W/kWgeDy1LxfCvnKgiXOUEmok9I2ZvO34s0MxyKgdyLr5M/uu19ngFSze3BnTeCTdeenzhgYsu+rZ0E79ZqFg5fR06ZcL1Pny3DTgAmyqxg6o4tvArYrRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPR5YLQuD21gt7bgzmHE/AjHWx5JZ6+N61QStTYGmxw=;
 b=GGf9juaTYdJBdaA705QXfj+yUyjWq5t8i+LZ1iekEwq3dmmviRBhhG3SxK+HJB7phhSHPU08A20k5mGOjVCJPG9I5fR27D5SQoERwLRHPdk193yk1PS3LZiGFpracFlc3/AWyfc5wnyCNbYGoYcuJnZbrThtHgwSkv5d3tjH7sj42zCUD+iMctn72lyMSAEk+jA8BqtdsBPE1obsvq022utfdwCLBhW6tTeXBAgdnsHtGq00d6ISmvdwF1Lrr6voz2WL7ZmTs3LQRk7Z8iCbJAXa+Zg/WroGyrjp+K4cQU+K+2x/NaLgv3KHQ8wp6h2r8b6XUVQVsQy9xXgIesQIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPR5YLQuD21gt7bgzmHE/AjHWx5JZ6+N61QStTYGmxw=;
 b=JY0zmGQ6Vm8+8caDO59BSrb3Umk1domnSYSNCkMUlx3zD+tRXSom4otbfcQW8/EQMqcWKtSPPfObhY6MYvxDEV19arQD2KkRyFKL6zmPlY+3uDJm6IjuVDXVzccrEuR9cpErw5lOFafcxM4/LqL6s5yHrn5fMejwH4Da8oajE2k=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Topic: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Index: AQHZ+kyDxYKGSy7Hi0WFFm+WJG77tLBIEmwAgAB07AA=
Date: Sat, 14 Oct 2023 01:30:21 +0000
Message-ID: <DA0A28F9-36DC-4067-8134-C97C4F96D360@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-9-Henry.Wang@arm.com>
 <527635ac-88b4-4a98-b5b6-1bc2d8600377@xen.org>
In-Reply-To: <527635ac-88b4-4a98-b5b6-1bc2d8600377@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VE1PR08MB5615:EE_|AM7EUR03FT060:EE_|DB4PR08MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 14378cb6-f3fd-4a4f-2258-08dbcc55277c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c7Bb/l5T3Bqf38f5Mkp4puyd20ObL0hFU5ZpHu1SkD/+0OUSVTP3a9LdSjsB22od72+x23quNGpXM1bO5EsiW+pHVQNpi8VpqBF0Zkao7lVMs9Ju6AG0s/SRaLU8MavTMOaAxxPPGpYNlwOah25U/EItp7TbrGrOX4r9ugCsLoYHx+5OO3FT3JT4lS+IWqePqsVyljWFq/LFgo8PqoQQUF2Nwq7n60huTPUv1cYQ0rE70Q+kU4XEYgn92Q5PBm3GfmaevSXSVaPI8WX9pSSXYGAHTVHnHsigRSWfTf++wQQdw20yivRol460V5abkZEXqkgo9vrGEHpStmZwBg2LB03Ys2rSqmufOFXCk9fdLQcQIvNOvld7B7r+z/rseZ2BJ07MZpfZHSy+4VJd9etX43hkid44Htc3iZ3q+AqpOfiQbnkB4IIxTHtnA8NDjfRExOr55fASSqlM4qZbAb39doNIQUF5dcrLnRXMqqvHNEYrOPTpRH4JYdybsD323fJY2nM6+UhVu7sK+bLGw3WuhckjiVqQFLk/2eSFLXYFQvhzTEGzbHGMzCR0mW6C7AvH+PBMa4A/dYv42cTjPMPTRzpUr6A2parkW3wnrsfxdZFAkai7+lMCO9EaOKdA7vllNIgVFClTyjYrnLO3Y+Zw7w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(122000001)(86362001)(33656002)(36756003)(38070700005)(83380400001)(2906002)(38100700002)(71200400001)(5660300002)(8676002)(110136005)(4326008)(53546011)(76116006)(54906003)(66476007)(64756008)(6512007)(6636002)(66556008)(316002)(6506007)(66446008)(66946007)(91956017)(41300700001)(8936002)(6486002)(478600001)(2616005)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AD288689BF371408869750380E2DE93@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5615
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef15bc3b-06ec-4aca-046f-08dbcc552200
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zx3LbcO8dLdF71B9oR33wLjuTNKW5rRWnxDJRCgYXJ309N8GkMmymRDlAAXdd1htdgK8dQ7Tz17VNpwxBGQbG7jqVIaaOeAXxxs00NGxl9Wfc2j/Jakmqo4fqr2pzIc4JpFLEbSSFrnwQRb7b5/P4ydbP+7x+pLwxbsnJ6bOz9EB+S0VnFHiz2SOs06xsjJbyJ3qj1THQENZO0d+RNE5UQ7rD8uotl3hizRrSnMTxyJqIWazQncNc3OdPq5xx/mJv7I0UvbiIjVgFEQ/7+6YOMRBnnvPiE1S0SEhZbgbq/Li/bg9uZLmSjugQahNQ55M+jVCGU4x365pmvIk1nZ/FgwSms0L0DKKhdCIGcMIyssoMe419ElvjUcu2/9txHXG2zs3sZncyyOLlvwouNpA3evoKNHN5+J4e1jv/LyCrriLH63hfVNljrY8IPqjjoHeP9cQoTYsi8/Co0fB9f1RaAiVUKEb/eJwSoiBqSvUhW7EBT0qrDNMXCgTn1RUknHqy494EAm+KVv/qXZQppUDQ6Nyrz9kLPD/N8Z8Dk4WtYfndDRA1V3QC3VxQJepZ76aGUg42tJnuNTsusTjRAlDF1HORUI4oi9C2K82XKdCfEcUDgyNTuQYUNCdiKva7dStkCqKRbusCBzzzxYUcS5EN2zE2gWTTRKf8GZBS4D6IMln/++QqsxtRgfsfdjT+97IXukECga412zwTnPsEsLwpJC0m0eTdsJrvvdvYDkyVAeGpbCDBjp8V/sPSNLaSG3f
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(46966006)(40470700004)(36840700001)(36860700001)(26005)(2616005)(336012)(53546011)(6512007)(40460700003)(40480700001)(36756003)(82740400003)(33656002)(86362001)(356005)(81166007)(2906002)(6486002)(110136005)(4326008)(8676002)(478600001)(5660300002)(83380400001)(47076005)(6506007)(6636002)(70586007)(8936002)(41300700001)(316002)(54906003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 01:30:30.9165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14378cb6-f3fd-4a4f-2258-08dbcc55277c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8056

SGkgSnVsaWVuLA0KDQooU2VuZGluZyB0aGlzIGVtYWlsIGRpcmVjdGx5IOKAnFRvOuKAnSBCZXJ0
cmFuZCBhbmQgU3RlZmFubyB0byBjYXRjaCB0aGVpciBhdHRlbnRpb24gYWJvdXQNCm9uZSBxdWVz
dGlvbiB0aGF0IHlvdSBhc2sgdGhlbSkNCg0KPiBPbiBPY3QgMTQsIDIwMjMsIGF0IDAyOjMxLCBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEhlbnJ5LA0KPiAN
Cj4gc29tZSBtb3JlIHJlbWFya3MuDQo+IA0KPiBPbiAwOS8xMC8yMDIzIDAyOjAzLCBIZW5yeSBX
YW5nIHdyb3RlOg0KPj4gKy8qDQo+PiArICogSW52YWxpZGF0ZSBhbGwgZW50cmllcyBpbiB0aGUg
cm9vdCBwYWdlLXRhYmxlcy4gVGhpcyBpcw0KPj4gKyAqIHVzZWZ1bCB0byBnZXQgZmF1bHQgb24g
ZW50cnkgYW5kIGRvIGFuIGFjdGlvbi4NCj4+ICsgKg0KPj4gKyAqIHAybV9pbnZhbGlkX3Jvb3Qo
KSBzaG91bGQgbm90IGJlIGNhbGxlZCB3aGVuIHRoZSBQMk0gaXMgc2hhcmVkIHdpdGgNCj4+ICsg
KiB0aGUgSU9NTVUgYmVjYXVzZSBpdCB3aWxsIGNhdXNlIElPTU1VIGZhdWx0Lg0KPj4gKyAqLw0K
Pj4gK3ZvaWQgcDJtX2ludmFsaWRhdGVfcm9vdChzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQ0KPiAN
Cj4gSSB0aGluayB0aGlzIGZ1bmN0aW9uIGRvZXNuJ3QgbWFrZSBzZW5zZSBmb3IgdGhlIE1QVS4g
V2hhdCB3b3VsZCBpbnZhbGlkYXRlPw0KPiANCj4gVGhlIG9ubHkgY2FsbGVyIG91dHNpZGUgb2Yg
dGhlIGZpbGUgaXMgaW4gYXJjaF9kb21haW5fY3JlYXRpb25fZmluaXNoZWQoKS4gVGhpcyB3YXMg
dXNlZCBmb3Igc2V0L3dheSBlbXVsYXRpb24gd2hpY2ggSSBiZWxpZXZlIHdpbGwgYmUgZGlmZmlj
dWx0IHRvIGltcGxlbWVudCBlZmZpY2llbnRseSBmb3IgdGhlIE1QVSAoc2VlIG15IG90aGVyIHJl
cGx5IHRvIHRoaXMgcGF0Y2gpLg0KPiANCj4gU28gSSB3b3VsZCBjb25zaWRlciB0byBtb3ZlIGFy
Y2hfZG9tYWluX2NyZWF0aW9uX2ZpbmlzaGVkKCkgaW4gbW11L3AybS5jIG9yIGNyZWF0aW5nIGEg
bmV3IGZ1bmN0aW9uIHAybV9kb21haW5fY3JlYXRpb25fZmluaXNoZWQoKSB3aGljaCBpcyBjYWxs
ZWQgZnJvbSBhcmNoX2RvbWFpbl9jcmVhdGlvbl9maW5pc2hlZCgpLg0KDQpZZWFoIG1ha2Ugc2Vu
c2UsIEkgd2lsbCBkbyB0aGUgc3VnZ2VzdGVkIGNoYW5nZSBpbiB2OC4NCg0KPiBbLi4uXQ0KPiAN
Cj4+ICsvKg0KPj4gKyAqIENsZWFuICYgaW52YWxpZGF0ZSBSQU0gYXNzb2NpYXRlZCB0byB0aGUg
Z3Vlc3QgdkNQVS4NCj4+ICsgKg0KPj4gKyAqIFRoZSBmdW5jdGlvbiBjYW4gb25seSB3b3JrIHdp
dGggdGhlIGN1cnJlbnQgdkNQVSBhbmQgc2hvdWxkIGJlIGNhbGxlZA0KPj4gKyAqIHdpdGggSVJR
IGVuYWJsZWQgYXMgdGhlIHZDUFUgY291bGQgZ2V0IHByZWVtcHRlZC4NCj4+ICsgKi8NCj4+ICt2
b2lkIHAybV9mbHVzaF92bShzdHJ1Y3QgdmNwdSAqdikNCj4gSSBiZWxpZXZlIGFuIGltcGxlbWVu
dGF0aW9uIG9mIHAybV9mbHVzaF92bSgpIHdvdWxkIGJlIHF1aXRlIGV4cGVuc2l2ZSBmb3IgdGhl
IE1QVS4gSXQgd291bGQgYmUgYmV0dGVyIHRvIG5vdCBlbXVsYXRlIHNldC93YXkgZm9yIG5vdy4N
Cj4gDQo+IEl0IHdvdWxkIGFsc28gZmVlbCBhIGJpdCBvZGQgdG8gbGVhdmUgaXQgdW5pbXBsZW1l
bnRlZCBhbmQgY2FsbGVkIGZyb20gY2hlY2tfZm9yX3ZjcHVfd29yaygpLiBTbyBtYXliZSB3ZSB3
YW50IHRvIHJlbmFtZSBpdC4gSSBkb24ndCBoYXZlIGEgZ29vb2QgbmFtZSBzdWdnZXN0aW9uIHRo
b3VnaC4gQmVydHJhbmQsIFN0ZWZhbm8/DQoNClNlZSB0aGUgYmVnaW5uaW5nIG9mIHRoaXMgZW1h
aWwuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IFsuLi5dDQo+IA0KPiAtLSANCj4g
SnVsaWVuIEdyYWxsDQoNCg==

