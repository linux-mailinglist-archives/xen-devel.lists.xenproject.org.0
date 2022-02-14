Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5130A4B5147
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271890.466612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbBA-00080t-1g; Mon, 14 Feb 2022 13:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271890.466612; Mon, 14 Feb 2022 13:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbB9-0007yK-Td; Mon, 14 Feb 2022 13:14:07 +0000
Received: by outflank-mailman (input) for mailman id 271890;
 Mon, 14 Feb 2022 13:14:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gtPN=S5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nJbB8-0007Ul-NY
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:14:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc5e7e16-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:14:05 +0100 (CET)
Received: from AM6PR0502CA0072.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::49) by AS8PR08MB6947.eurprd08.prod.outlook.com
 (2603:10a6:20b:346::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 13:14:03 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::4b) by AM6PR0502CA0072.outlook.office365.com
 (2603:10a6:20b:56::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Mon, 14 Feb 2022 13:14:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 13:14:02 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Mon, 14 Feb 2022 13:14:02 +0000
Received: from af077a362695.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49D34EA8-2974-41C6-AC10-F2F44D52D8EB.1; 
 Mon, 14 Feb 2022 13:13:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id af077a362695.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 13:13:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB3233.eurprd08.prod.outlook.com (2603:10a6:208:60::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 13:13:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 13:13:54 +0000
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
X-Inumbo-ID: fc5e7e16-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olIGzV+p0Y8nNDif8TtwU+q9HZV6ntiPI7JyCWMm3no=;
 b=pVi+VRQKwvKDoJr1ARHxDNJcKmxCBYEhjVJkOrtp/bpUUUSP/J41WaAu2Y3/cG5cwaRKub6JDWiNORYS102qtyK+D6234RDbHvUznyyxYRMTQk7mrL7LA4X0/W6pCsd4WlY5zv54BnYHeHQmNAP4I0eNR7akxEEZICp9vO3X+aE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: abb6e5cc35c59f7d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8PmZoY2lh6q3FuV37ic5Evz2aepF7yuQF1eqgaJlp3ynCcSRYa9kJy1B/1HtllAK/B+xTECY4U299fcEIJwxv3XHfn9kT8NPlcxjNxkaADbP5Bn8Q9kyw4HRZ18zymu4mgG+dIKyPbeLCbp40CxpCB3U3jITNVYDo2MhkO0PaQaxeYnwGbuDZrnUmq6LztPMdV1TIa4S116wcaVB/aaeaBtS3MGIywcargxAIp7j6RBD8KF2U1mp5e1rcm1q/Rf/b4+RTq+jfZlfQToQfZhKA9AO/+H3NVbVghZMmzJ4Mc5zfWcX8g1SMZdtQe3Ou5+SNAsG+40UnVRyHu2oCrXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olIGzV+p0Y8nNDif8TtwU+q9HZV6ntiPI7JyCWMm3no=;
 b=JeFe2khRLDKPmn04Ab6ZFerG6xWCvg1cBSRPR3+8Ybi1v2I3YgisKjNWO6+kgPOqbxsh1wHC4cjWpXnrqrfh87YdxjTzfG4895n3htnVHZd0fSkE+gtAhGSDRO7an7WwVzRUQW84H1CXDvDSj9UUz/hXOvIjRAM7bT6YGvgn9c7id4dWVq77JXNEg0v6KUqIIQbguOsGN2W5/QPf8M/cZSVHuvBSEgiBgCp5P26IIzBO/AYJJOB/avz+yaF5Yvx7tJKH9oMG2PQpdb/EgdrZL8ndoM3AZoclE0AU5ej0Z6YgGRUzXfCRRG4fzZF3FB6I3dSWzXPc09L/+L/9cA+Y8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olIGzV+p0Y8nNDif8TtwU+q9HZV6ntiPI7JyCWMm3no=;
 b=pVi+VRQKwvKDoJr1ARHxDNJcKmxCBYEhjVJkOrtp/bpUUUSP/J41WaAu2Y3/cG5cwaRKub6JDWiNORYS102qtyK+D6234RDbHvUznyyxYRMTQk7mrL7LA4X0/W6pCsd4WlY5zv54BnYHeHQmNAP4I0eNR7akxEEZICp9vO3X+aE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
Thread-Topic: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
Thread-Index: AQHYIaGnBAePJgt7y0O7PyvIWQlKrKyTBimA
Date: Mon, 14 Feb 2022 13:13:54 +0000
Message-ID: <71997BED-096C-4168-AF40-D74C616D6A20@arm.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-3-andrew.cooper3@citrix.com>
In-Reply-To: <20220214125127.17985-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 71d127db-6a54-4f93-ca21-08d9efbbdeec
x-ms-traffictypediagnostic:
	AM0PR08MB3233:EE_|AM5EUR03FT016:EE_|AS8PR08MB6947:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6947020DC0FFC90C92E0C6EF9D339@AS8PR08MB6947.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5dGWQaqB+FW+RXsQvTtkvuqPEtTBbgRX+VesBL5eGrMX6CDvzV6Lhfm5C6NsUeEE7Q3tPq/MpJiMb2AHwRc4Gi/QNnRG0jSmkPsCY0iV30J0WB6qLF4/a3A3umk/baG5DrA6ZVbs45uofHkg4PA7OqFzKWs2zCgXObfda1vW7Iw6aqAfu9CUzGBeDrewn8BN3OQAkQ7VIBXw8uitACJPY8RiuBbqpdVd1sKsWadMqUAS3+MasE9RXxmdXY9cbSpCHoF+kHK5OD69yfg79bGtkdzGVkARLclHnB0lIW9yLJBCmNUzBDSBsVahhCJ/VT5n2E1oR93/nkHzyd8niEyT+cosbk/73x5hL2n8t+PhHJnsJXaTJ//NJSme0tqvzuRU9XICTuGRAJAR1DGYF9k9Md++JIFfkJCyE3nt2z3TIwLoFoQpGVqXZ7qOJEm+7G/paq0+GOZvWnWuG70zru9NSpzCwIe2vxmjR1uatwc9xXjMpFI571tv48MQt+hyccPKOgCRKOWSphwcIr2PFj5EsMrisNpdd1fQhOpRUZBp5u3pYEeZQXb4/oqW7sXJ+mNoepA4vOFh0eJENSnObKPTFIGdu8Ed4/BDPebxHTxoizlJ9SQAZeqItEmfOTacTMDZXiHQtnY2EixQGiYI4tg4/H1e88MyG4qiJfNcT8gwIRv3i0E/RbwdwQFzVW9ZoPuqErpS7LaysHRfgWLAsMXJy9lPvXUbpYOyJrDex8KrG8/+1fF+Pbh+eSpNBBRJmMAY
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(64756008)(66446008)(66476007)(8676002)(66556008)(66946007)(76116006)(54906003)(4326008)(91956017)(2906002)(6916009)(122000001)(38100700002)(38070700005)(8936002)(5660300002)(6486002)(2616005)(26005)(186003)(6506007)(36756003)(508600001)(86362001)(53546011)(33656002)(83380400001)(6512007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A501DA476E530442B8BED8646D240675@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3233
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fcaaf51f-75ef-43aa-9958-08d9efbbd9da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9hMbz7DxL+q8H9klrQhd6xWcI3Upm1F/M0gAQFr78EnIny0Ln8wjyoEwGcGvPyJMjb0T8t/ftX7j1QEaKhI4rkpWlxE7Khx/z9QF3FedvUZ7pmCtnAn9eDQ4ywrg31o4aW8undOVzan2VI7W+VT4mlxSghn58u8uxHnGxK1SqkPE043f0PnyO4ZWt6hcxFUKkYM5ZB6lPYDbxHi76Udr3Uoj1eHG6rVUO9tis4630vojVyDZTyeoFTZxV4RtYjzph3yaS7COXYfeSx4abDeJ9rVd/epVXwHzTvr8tEbwuzdgmsc8VhZCCgjKWLt2KZfwZcKGzSHD2qUX+Vgf2hesVu/aZcTXLOuWrjDKjKoGvG85X/MX3lkpjGti3SYG1SsOEYMqVgej0WSEFzkMg+6T4euQ/HeTit+RJd6HRqlOFZUf7UmoNyZAUe0I4UL5aPJhgHBbfO59ebYYUIuGHjd/l2R1QBXvUC0WuHBbHPatEiA5XoUPpSeAXm093I8eD0hRZRDDQUf/d2uhd92sqD1vwcYgWV0o09uNOiA5LaiNXCghnSalFHCT71KTLDodMavGgaGbB+mIIKlpncnYk9NdA2hjs7LFw+kJbglo6YES79FPLBnmnO2masCEBCsnQPFPpaNMkl8emkRMMskOFPscYiwpT5z5ISvvgOd29bXnMotY8VdiXrdkfhQQ3CS9eSwC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6486002)(53546011)(6506007)(36756003)(40460700003)(508600001)(356005)(81166007)(4326008)(6862004)(8676002)(70206006)(70586007)(86362001)(33656002)(54906003)(316002)(82310400004)(26005)(107886003)(2616005)(83380400001)(6512007)(186003)(5660300002)(8936002)(2906002)(336012)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:14:02.6760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d127db-6a54-4f93-ca21-08d9efbbdeec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6947

SGkgQW5kcmV3LA0KDQo+IE9uIDE0IEZlYiAyMDIyLCBhdCAxMjo1MCwgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBUaGVyZSBhcmUgZXhhY3Rs
eSAzIGNhbGxlcnMgb2Ygc29ydCgpIGluIHRoZSBoeXBlcnZpc29yLiAgQ2FsbGJhY2tzIGluIGEg
dGlnaHQNCj4gbG9vcCBsaWtlIHRoaXMgYXJlIHByb2JsZW1hdGljIGZvciBwZXJmb3JtYW5jZSwg
ZXNwZWNpYWxseSB3aXRoIFNwZWN0cmUgdjINCj4gcHJvdGVjdGlvbnMsIHdoaWNoIGlzIHdoeSBl
eHRlcm4gaW5saW5lIGlzIHVzZWQgY29tbW9ubHkgYnkgbGlicmFyaWVzLg0KPiANCj4gQm90aCBB
Uk0gY2FsbGVycyBwYXNzIGluIE5VTEwgZm9yIHRoZSBzd2FwIGZ1bmN0aW9uLCBhbmQgd2hpbGUg
dGhpcyBtaWdodCBzZWVtDQo+IGxpa2UgYW4gYXR0cmFjdGl2ZSBvcHRpb24gYXQgZmlyc3QsIGl0
IGNhdXNlcyBnZW5lcmljX3N3YXAoKSB0byBiZSB1c2VkLCB3aGljaA0KPiBmb3JjZWQgYSBieXRl
LXdpc2UgY29weS4gIFByb3ZpZGUgcmVhbCBzd2FwIGZ1bmN0aW9ucyBzbyB0aGUgY29tcGlsZXIg
Y2FuDQo+IG9wdGltaXNlIHByb3Blcmx5LCB3aGljaCBpcyB2ZXJ5IGltcG9ydGFudCBmb3IgQVJN
IGRvd25zdHJlYW1zIHdoZXJlDQo+IG1pbGxpc2Vjb25kcyB1bnRpbCB0aGUgc3lzdGVtIGlzIHVw
IG1hdHRlcnMuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkp1c3Qgb25lIGNvbW1lbnQg
Zml4IGFmdGVyLCB3aXRoIGl0IGZpeGVkIGZvciB0aGUgYXJtIHBhcnQ6DQoNClJldmlld2VkLWJ5
OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQoNCj4gLS0tDQo+
IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+IENDOiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+
IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENDOiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBDQzogVm9sb2R5bXlyIEJhYmNodWsgPFZv
bG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBDQzogQmVydHJhbmQgTWFycXVpcyA8YmVydHJh
bmQubWFycXVpc0Bhcm0uY29tPg0KPiANCj4gdjI6DQo+ICogQWRqdXN0IGNvbW1pdCBtZXNzYWdl
DQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIHwgIDkgKysrKystDQo+IHhlbi9hcmNo
L2FybS9pby5jICAgICAgfCAgOSArKysrKy0NCj4geGVuL2luY2x1ZGUveGVuL3NvcnQuaCB8IDU1
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4geGVuL2xpYi9zb3J0LmMgICAg
ICAgICB8IDgwICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQo+IDQgZmlsZXMgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgODEgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2Fy
bS9ib290ZmR0LmMNCj4gaW5kZXggYWZhYTBlMjQ5YjcxLi5lMzE4ZWY5NjAzODYgMTAwNjQ0DQo+
IC0tLSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3Rm
ZHQuYw0KPiBAQCAtNDQ4LDYgKzQ0OCwxMyBAQCBzdGF0aWMgaW50IF9faW5pdCBjbXBfbWVtb3J5
X25vZGUoY29uc3Qgdm9pZCAqa2V5LCBjb25zdCB2b2lkICplbGVtKQ0KPiAgICAgcmV0dXJuIDA7
DQo+IH0NCj4gDQo+ICtzdGF0aWMgdm9pZCBfX2luaXQgc3dhcF9tZW1vcnlfbm9kZSh2b2lkICpf
YSwgdm9pZCAqX2IsIHNpemVfdCBzaXplKQ0KPiArew0KPiArICAgIHN0cnVjdCBtZW1iYW5rICph
ID0gX2EsICpiID0gX2I7DQo+ICsNCj4gKyAgICBTV0FQKCphLCAqYik7DQo+ICt9DQo+ICsNCj4g
LyoqDQo+ICAqIGJvb3RfZmR0X2luZm8gLSBpbml0aWFsaXplIGJvb3RpbmZvIGZyb20gYSBEVEIN
Cj4gICogQGZkdDogZmxhdHRlbmVkIGRldmljZSB0cmVlIGJpbmFyeQ0KPiBAQCAtNDcyLDcgKzQ3
OSw3IEBAIHNpemVfdCBfX2luaXQgYm9vdF9mZHRfaW5mbyhjb25zdCB2b2lkICpmZHQsIHBhZGRy
X3QgcGFkZHIpDQo+ICAgICAgKiB0aGUgYmFua3Mgc29ydGVkIGluIGFzY2VuZGluZyBvcmRlci4g
U28gc29ydCB0aGVtIHRocm91Z2guDQo+ICAgICAgKi8NCj4gICAgIHNvcnQoYm9vdGluZm8ubWVt
LmJhbmssIGJvb3RpbmZvLm1lbS5ucl9iYW5rcywgc2l6ZW9mKHN0cnVjdCBtZW1iYW5rKSwNCj4g
LSAgICAgICAgIGNtcF9tZW1vcnlfbm9kZSwgTlVMTCk7DQo+ICsgICAgICAgICBjbXBfbWVtb3J5
X25vZGUsIHN3YXBfbWVtb3J5X25vZGUpOw0KPiANCj4gICAgIGVhcmx5X3ByaW50X2luZm8oKTsN
Cj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW8uYyBiL3hlbi9hcmNoL2FybS9pby5j
DQo+IGluZGV4IDcyOTI4N2UzN2M1OS4uMWEwNjZmOWFlNTAyIDEwMDY0NA0KPiAtLS0gYS94ZW4v
YXJjaC9hcm0vaW8uYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vaW8uYw0KPiBAQCAtODAsNiArODAs
MTMgQEAgc3RhdGljIGludCBjbXBfbW1pb19oYW5kbGVyKGNvbnN0IHZvaWQgKmtleSwgY29uc3Qg
dm9pZCAqZWxlbSkNCj4gICAgIHJldHVybiAwOw0KPiB9DQo+IA0KPiArc3RhdGljIHZvaWQgc3dh
cF9tbWlvX2hhbmRsZXIodm9pZCAqX2EsIHZvaWQgKl9iLCBzaXplX3Qgc2l6ZSkNCj4gK3sNCj4g
KyAgICBzdHJ1Y3QgbW1pb19oYW5kbGVyICphID0gX2EsICpiID0gX2I7DQo+ICsNCj4gKyAgICBT
V0FQKCphLCAqYik7DQo+ICt9DQo+ICsNCj4gc3RhdGljIGNvbnN0IHN0cnVjdCBtbWlvX2hhbmRs
ZXIgKmZpbmRfbW1pb19oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IGdwYSkNCj4gew0K
PiBAQCAtMTcwLDcgKzE3Nyw3IEBAIHZvaWQgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKHN0cnVjdCBk
b21haW4gKmQsDQo+IA0KPiAgICAgLyogU29ydCBtbWlvIGhhbmRsZXJzIGluIGFzY2VuZGluZyBv
cmRlciBiYXNlZCBvbiBiYXNlIGFkZHJlc3MgKi8NCj4gICAgIHNvcnQodm1taW8tPmhhbmRsZXJz
LCB2bW1pby0+bnVtX2VudHJpZXMsIHNpemVvZihzdHJ1Y3QgbW1pb19oYW5kbGVyKSwNCj4gLSAg
ICAgICAgIGNtcF9tbWlvX2hhbmRsZXIsIE5VTEwpOw0KPiArICAgICAgICAgY21wX21taW9faGFu
ZGxlciwgc3dhcF9tbWlvX2hhbmRsZXIpOw0KPiANCj4gICAgIHdyaXRlX3VubG9jaygmdm1taW8t
PmxvY2spOw0KPiB9DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc29ydC5oIGIveGVu
L2luY2x1ZGUveGVuL3NvcnQuaA0KPiBpbmRleCBhNDAzNjUyOTQ4ZTcuLjAxNDc5ZWE0NDYwNiAx
MDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NvcnQuaA0KPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vc29ydC5oDQo+IEBAIC0zLDggKzMsNjEgQEANCj4gDQo+ICNpbmNsdWRlIDx4ZW4vdHlw
ZXMuaD4NCj4gDQo+ICsvKg0KPiArICogc29ydCAtIHNvcnQgYW4gYXJyYXkgb2YgZWxlbWVudHMN
Cj4gKyAqIEBiYXNlOiBwb2ludGVyIHRvIGRhdGEgdG8gc29ydA0KPiArICogQG51bTogbnVtYmVy
IG9mIGVsZW1lbnRzDQo+ICsgKiBAc2l6ZTogc2l6ZSBvZiBlYWNoIGVsZW1lbnQNCj4gKyAqIEBj
bXA6IHBvaW50ZXIgdG8gY29tcGFyaXNvbiBmdW5jdGlvbg0KPiArICogQHN3YXA6IHBvaW50ZXIg
dG8gc3dhcCBmdW5jdGlvbiBvciBOVUxMDQoNClRoZSBmdW5jdGlvbiBpcyBub3QgYWNjZXB0aW5n
IGFueW1vcmUgdG8gaGF2ZSBOVUxMIGFzIHBhcmFtZXRlci4NClRoZSBjb21tZW50IHNob3VsZCBi
ZSBmaXhlZCBoZXJlLg0KDQpCZXJ0cmFuZA0KDQo+ICsgKg0KPiArICogVGhpcyBmdW5jdGlvbiBk
b2VzIGEgaGVhcHNvcnQgb24gdGhlIGdpdmVuIGFycmF5LiBZb3UgbWF5IHByb3ZpZGUgYQ0KPiAr
ICogc3dhcCBmdW5jdGlvbiBvcHRpbWl6ZWQgdG8geW91ciBlbGVtZW50IHR5cGUuDQo+ICsgKg0K
PiArICogU29ydGluZyB0aW1lIGlzIE8obiBsb2cgbikgYm90aCBvbiBhdmVyYWdlIGFuZCB3b3Jz
dC1jYXNlLiBXaGlsZQ0KPiArICogcXNvcnQgaXMgYWJvdXQgMjAlIGZhc3RlciBvbiBhdmVyYWdl
LCBpdCBzdWZmZXJzIGZyb20gZXhwbG9pdGFibGUNCj4gKyAqIE8obipuKSB3b3JzdC1jYXNlIGJl
aGF2aW9yIGFuZCBleHRyYSBtZW1vcnkgcmVxdWlyZW1lbnRzIHRoYXQgbWFrZQ0KPiArICogaXQg
bGVzcyBzdWl0YWJsZSBmb3Iga2VybmVsIHVzZS4NCj4gKyAqLw0KPiArI2lmbmRlZiBTT1JUX0lN
UExFTUVOVEFUSU9ODQo+ICtleHRlcm4gZ251X2lubGluZQ0KPiArI2VuZGlmDQo+IHZvaWQgc29y
dCh2b2lkICpiYXNlLCBzaXplX3QgbnVtLCBzaXplX3Qgc2l6ZSwNCj4gICAgICAgICAgIGludCAo
KmNtcCkoY29uc3Qgdm9pZCAqLCBjb25zdCB2b2lkICopLA0KPiAtICAgICAgICAgIHZvaWQgKCpz
d2FwKSh2b2lkICosIHZvaWQgKiwgc2l6ZV90KSk7DQo+ICsgICAgICAgICAgdm9pZCAoKnN3YXAp
KHZvaWQgKiwgdm9pZCAqLCBzaXplX3QpKQ0KPiArew0KPiArICAgIC8qIHByZS1zY2FsZSBjb3Vu
dGVycyBmb3IgcGVyZm9ybWFuY2UgKi8NCj4gKyAgICBzaXplX3QgaSA9IChudW0gLyAyKSAqIHNp
emUsIG4gPSBudW0gKiBzaXplLCBjLCByOw0KPiArDQo+ICsgICAgLyogaGVhcGlmeSAqLw0KPiAr
ICAgIHdoaWxlICggaSA+IDAgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgZm9yICggciA9IGkgLT0g
c2l6ZTsgciAqIDIgKyBzaXplIDwgbjsgciA9IGMgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAg
ICAgICBjID0gciAqIDIgKyBzaXplOw0KPiArICAgICAgICAgICAgaWYgKCAoYyA8IG4gLSBzaXpl
KSAmJiAoY21wKGJhc2UgKyBjLCBiYXNlICsgYyArIHNpemUpIDwgMCkgKQ0KPiArICAgICAgICAg
ICAgICAgIGMgKz0gc2l6ZTsNCj4gKyAgICAgICAgICAgIGlmICggY21wKGJhc2UgKyByLCBiYXNl
ICsgYykgPj0gMCApDQo+ICsgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgICAgICBz
d2FwKGJhc2UgKyByLCBiYXNlICsgYywgc2l6ZSk7DQo+ICsgICAgICAgIH0NCj4gKyAgICB9DQo+
ICsNCj4gKyAgICAvKiBzb3J0ICovDQo+ICsgICAgZm9yICggaSA9IG47IGkgPiAwOyApDQo+ICsg
ICAgew0KPiArICAgICAgICBpIC09IHNpemU7DQo+ICsgICAgICAgIHN3YXAoYmFzZSwgYmFzZSAr
IGksIHNpemUpOw0KPiArICAgICAgICBmb3IgKCByID0gMDsgciAqIDIgKyBzaXplIDwgaTsgciA9
IGMgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAgICBjID0gciAqIDIgKyBzaXplOw0KPiAr
ICAgICAgICAgICAgaWYgKCAoYyA8IGkgLSBzaXplKSAmJiAoY21wKGJhc2UgKyBjLCBiYXNlICsg
YyArIHNpemUpIDwgMCkgKQ0KPiArICAgICAgICAgICAgICAgIGMgKz0gc2l6ZTsNCj4gKyAgICAg
ICAgICAgIGlmICggY21wKGJhc2UgKyByLCBiYXNlICsgYykgPj0gMCApDQo+ICsgICAgICAgICAg
ICAgICAgYnJlYWs7DQo+ICsgICAgICAgICAgICBzd2FwKGJhc2UgKyByLCBiYXNlICsgYywgc2l6
ZSk7DQo+ICsgICAgICAgIH0NCj4gKyAgICB9DQo+ICt9DQo+IA0KPiAjZW5kaWYgLyogX19YRU5f
U09SVF9IX18gKi8NCj4gZGlmZiAtLWdpdCBhL3hlbi9saWIvc29ydC5jIGIveGVuL2xpYi9zb3J0
LmMNCj4gaW5kZXggMzVjZTBkN2FiZGVjLi5iN2U3OGNjMGU4ZDIgMTAwNjQ0DQo+IC0tLSBhL3hl
bi9saWIvc29ydC5jDQo+ICsrKyBiL3hlbi9saWIvc29ydC5jDQo+IEBAIC00LDgxICs0LDUgQEAN
Cj4gICogSmFuIDIzIDIwMDUgIE1hdHQgTWFja2FsbCA8bXBtQHNlbGVuaWMuY29tPg0KPiAgKi8N
Cj4gDQo+IC0jaW5jbHVkZSA8eGVuL3R5cGVzLmg+DQo+IC0NCj4gLXN0YXRpYyB2b2lkIHUzMl9z
d2FwKHZvaWQgKmEsIHZvaWQgKmIsIHNpemVfdCBzaXplKQ0KPiAtew0KPiAtICAgIHVpbnQzMl90
IHQgPSAqKHVpbnQzMl90ICopYTsNCj4gLQ0KPiAtICAgICoodWludDMyX3QgKilhID0gKih1aW50
MzJfdCAqKWI7DQo+IC0gICAgKih1aW50MzJfdCAqKWIgPSB0Ow0KPiAtfQ0KPiAtDQo+IC1zdGF0
aWMgdm9pZCBnZW5lcmljX3N3YXAodm9pZCAqYSwgdm9pZCAqYiwgc2l6ZV90IHNpemUpDQo+IC17
DQo+IC0gICAgY2hhciB0Ow0KPiAtDQo+IC0gICAgZG8gew0KPiAtICAgICAgICB0ID0gKihjaGFy
ICopYTsNCj4gLSAgICAgICAgKihjaGFyICopYSsrID0gKihjaGFyICopYjsNCj4gLSAgICAgICAg
KihjaGFyICopYisrID0gdDsNCj4gLSAgICB9IHdoaWxlICggLS1zaXplID4gMCApOw0KPiAtfQ0K
PiAtDQo+IC0vKg0KPiAtICogc29ydCAtIHNvcnQgYW4gYXJyYXkgb2YgZWxlbWVudHMNCj4gLSAq
IEBiYXNlOiBwb2ludGVyIHRvIGRhdGEgdG8gc29ydA0KPiAtICogQG51bTogbnVtYmVyIG9mIGVs
ZW1lbnRzDQo+IC0gKiBAc2l6ZTogc2l6ZSBvZiBlYWNoIGVsZW1lbnQNCj4gLSAqIEBjbXA6IHBv
aW50ZXIgdG8gY29tcGFyaXNvbiBmdW5jdGlvbg0KPiAtICogQHN3YXA6IHBvaW50ZXIgdG8gc3dh
cCBmdW5jdGlvbiBvciBOVUxMDQo+IC0gKg0KPiAtICogVGhpcyBmdW5jdGlvbiBkb2VzIGEgaGVh
cHNvcnQgb24gdGhlIGdpdmVuIGFycmF5LiBZb3UgbWF5IHByb3ZpZGUgYQ0KPiAtICogc3dhcCBm
dW5jdGlvbiBvcHRpbWl6ZWQgdG8geW91ciBlbGVtZW50IHR5cGUuDQo+IC0gKg0KPiAtICogU29y
dGluZyB0aW1lIGlzIE8obiBsb2cgbikgYm90aCBvbiBhdmVyYWdlIGFuZCB3b3JzdC1jYXNlLiBX
aGlsZQ0KPiAtICogcXNvcnQgaXMgYWJvdXQgMjAlIGZhc3RlciBvbiBhdmVyYWdlLCBpdCBzdWZm
ZXJzIGZyb20gZXhwbG9pdGFibGUNCj4gLSAqIE8obipuKSB3b3JzdC1jYXNlIGJlaGF2aW9yIGFu
ZCBleHRyYSBtZW1vcnkgcmVxdWlyZW1lbnRzIHRoYXQgbWFrZQ0KPiAtICogaXQgbGVzcyBzdWl0
YWJsZSBmb3Iga2VybmVsIHVzZS4NCj4gLSAqLw0KPiAtDQo+IC12b2lkIHNvcnQodm9pZCAqYmFz
ZSwgc2l6ZV90IG51bSwgc2l6ZV90IHNpemUsDQo+IC0gICAgICAgICAgaW50ICgqY21wKShjb25z
dCB2b2lkICosIGNvbnN0IHZvaWQgKiksDQo+IC0gICAgICAgICAgdm9pZCAoKnN3YXApKHZvaWQg
Kiwgdm9pZCAqLCBzaXplX3Qgc2l6ZSkpDQo+IC17DQo+IC0gICAgLyogcHJlLXNjYWxlIGNvdW50
ZXJzIGZvciBwZXJmb3JtYW5jZSAqLw0KPiAtICAgIHNpemVfdCBpID0gKG51bSAvIDIpICogc2l6
ZSwgbiA9IG51bSAqIHNpemUsIGMsIHI7DQo+IC0NCj4gLSAgICBpZiAoICFzd2FwICkNCj4gLSAg
ICAgICAgc3dhcCA9IChzaXplID09IDQgPyB1MzJfc3dhcCA6IGdlbmVyaWNfc3dhcCk7DQo+IC0N
Cj4gLSAgICAvKiBoZWFwaWZ5ICovDQo+IC0gICAgd2hpbGUgKCBpID4gMCApDQo+IC0gICAgew0K
PiAtICAgICAgICBmb3IgKCByID0gaSAtPSBzaXplOyByICogMiArIHNpemUgPCBuOyByID0gYyAp
DQo+IC0gICAgICAgIHsNCj4gLSAgICAgICAgICAgIGMgPSByICogMiArIHNpemU7DQo+IC0gICAg
ICAgICAgICBpZiAoIChjIDwgbiAtIHNpemUpICYmIChjbXAoYmFzZSArIGMsIGJhc2UgKyBjICsg
c2l6ZSkgPCAwKSApDQo+IC0gICAgICAgICAgICAgICAgYyArPSBzaXplOw0KPiAtICAgICAgICAg
ICAgaWYgKCBjbXAoYmFzZSArIHIsIGJhc2UgKyBjKSA+PSAwICkNCj4gLSAgICAgICAgICAgICAg
ICBicmVhazsNCj4gLSAgICAgICAgICAgIHN3YXAoYmFzZSArIHIsIGJhc2UgKyBjLCBzaXplKTsN
Cj4gLSAgICAgICAgfQ0KPiAtICAgIH0NCj4gLQ0KPiAtICAgIC8qIHNvcnQgKi8NCj4gLSAgICBm
b3IgKCBpID0gbjsgaSA+IDA7ICkNCj4gLSAgICB7DQo+IC0gICAgICAgIGkgLT0gc2l6ZTsNCj4g
LSAgICAgICAgc3dhcChiYXNlLCBiYXNlICsgaSwgc2l6ZSk7DQo+IC0gICAgICAgIGZvciAoIHIg
PSAwOyByICogMiArIHNpemUgPCBpOyByID0gYyApDQo+IC0gICAgICAgIHsNCj4gLSAgICAgICAg
ICAgIGMgPSByICogMiArIHNpemU7DQo+IC0gICAgICAgICAgICBpZiAoIChjIDwgaSAtIHNpemUp
ICYmIChjbXAoYmFzZSArIGMsIGJhc2UgKyBjICsgc2l6ZSkgPCAwKSApDQo+IC0gICAgICAgICAg
ICAgICAgYyArPSBzaXplOw0KPiAtICAgICAgICAgICAgaWYgKCBjbXAoYmFzZSArIHIsIGJhc2Ug
KyBjKSA+PSAwICkNCj4gLSAgICAgICAgICAgICAgICBicmVhazsNCj4gLSAgICAgICAgICAgIHN3
YXAoYmFzZSArIHIsIGJhc2UgKyBjLCBzaXplKTsNCj4gLSAgICAgICAgfQ0KPiAtICAgIH0NCj4g
LX0NCj4gKyNkZWZpbmUgU09SVF9JTVBMRU1FTlRBVElPTg0KPiArI2luY2x1ZGUgPHhlbi9zb3J0
Lmg+DQo+IC0tIA0KPiAyLjExLjANCj4gDQoNCg==

