Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7966342A01C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206922.362613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDMN-0007bm-OQ; Tue, 12 Oct 2021 08:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206922.362613; Tue, 12 Oct 2021 08:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDMN-0007Yt-KW; Tue, 12 Oct 2021 08:42:07 +0000
Received: by outflank-mailman (input) for mailman id 206922;
 Tue, 12 Oct 2021 08:42:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8jq=PA=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maDMM-0007Yl-Lw
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:42:06 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.86]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8679cca3-e248-4af8-a883-509a74afdb45;
 Tue, 12 Oct 2021 08:42:05 +0000 (UTC)
Received: from DB9PR06CA0006.eurprd06.prod.outlook.com (2603:10a6:10:1db::11)
 by AM0PR08MB4323.eurprd08.prod.outlook.com (2603:10a6:208:13d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Tue, 12 Oct
 2021 08:41:50 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::85) by DB9PR06CA0006.outlook.office365.com
 (2603:10a6:10:1db::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Tue, 12 Oct 2021 08:41:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 08:41:49 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Tue, 12 Oct 2021 08:41:49 +0000
Received: from 7cf18b9fcf48.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F1AD805C-1B79-4E2C-82EC-FC44056647FD.1; 
 Tue, 12 Oct 2021 08:41:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7cf18b9fcf48.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 08:41:38 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB9PR08MB6346.eurprd08.prod.outlook.com (2603:10a6:10:25b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 08:41:34 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:41:34 +0000
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
X-Inumbo-ID: 8679cca3-e248-4af8-a883-509a74afdb45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkutoNjGLjMwbg6AXEtWuX80xaGsQXQVb0fNCzh1adA=;
 b=RHZWGMHpGLUgwZRSp8HK4W710/qmLsRt0scHF2ohC8KrcPG3k5epETefETwmZYp1By0IHT9537k8ohJOpfY/401gbgLMomPlb/YzpANnzyzVsWh1bw6N/gPzvZrOVpf2Rno+jeo9ciSoFQ1tPNw2mIafNpmoM+ts8+vxbzjfyEs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0431c04c60ab214e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HagpDoqf3H37fGU7EE5fjCjl2qjsjOsJkejjJquf6n4YkZrmLf3QcHeQUkqMf8NE6Dt73OueisK433YJLgqkaziawc/jaxLfsFzb8BWWy2Z3NNSytNpPwcS/2Z5by/fkK6HY/ereEpbx8pQUSCbvl3xkCORxuaCOpTrbirXYTNmBjsEdZd4ZEb0qWQF5y7yUtDXUhHPOo7Mb4bzaJdzNSzNzS99+I6sfc/pnJs43rik2NHXa3syI6iQbGswK7I8pPJnBeFkqz0/t2+XIssxzl857CCJdi/EZK+Vt4Xm2X473J3yPtZf6qyU6CNcnvIefq5x73CsgT2uhT1LsWM3XUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkutoNjGLjMwbg6AXEtWuX80xaGsQXQVb0fNCzh1adA=;
 b=LM4EkYqK/7tMaIDc52qYrtndMKO1ik6Nsx04Kqc+z0wFlqeLufVk9miyyAOnyYWW0RdSfLwFk1UIpgtRDxVq52iI3fjJT7Q0tvL8QwWxyLFDIfYTYDNHLK3HRN05LoOkh3c2jCEPuZ3PZfcOM2rY3/kKEOZgt5dIZuSiMXV1mkdn4e2iSlibiEsa2P1VshqEQE3s+DZPlHUK5MqvZXjcKS2k85sBbHrIUFvIlbXDDZLcNYFdrX8IxQeGuWnNQ89GrtoWIiw6doqo60GTowO+L8S8HjaHCJwPmL5vK4HdXU5LXY+3CttTzpaiAdL3716weOwD8Qg5e+J70bNzTANAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkutoNjGLjMwbg6AXEtWuX80xaGsQXQVb0fNCzh1adA=;
 b=RHZWGMHpGLUgwZRSp8HK4W710/qmLsRt0scHF2ohC8KrcPG3k5epETefETwmZYp1By0IHT9537k8ohJOpfY/401gbgLMomPlb/YzpANnzyzVsWh1bw6N/gPzvZrOVpf2Rno+jeo9ciSoFQ1tPNw2mIafNpmoM+ts8+vxbzjfyEs=
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
 AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4CAABOEAIAABXoAgAAEuYCAAAVHAIAAJiWAgAAK0ICAAQCPgIAAA0qA
Date: Tue, 12 Oct 2021 08:41:34 +0000
Message-ID: <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
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
In-Reply-To: <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e4617f27-a836-4c82-9050-08d98d5c2230
x-ms-traffictypediagnostic: DB9PR08MB6346:|AM0PR08MB4323:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB432312DA5C6D193AEADE1CCB9DB69@AM0PR08MB4323.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dAjKjQkbKbYQNR5RQynB7XutHDEdphyuD55evcAwRFjzfVkMC5RauN5q//2jLosCd9wPYRlFnYy5yseNJD0QO1V3xKnjNJyerF9dO9eqpD61dPMV3pp7t8eWoSrwDTKDgAgbJwf90QhBVSHKw5VunZooJC6ecx3Prb3swH+EbzpscYIzyG/RBRZKhdXA2e+FrR9NhPEjw/64CEXIKHwnX29GbpExvvcRsX+PL/A2GJF2kttkBcZfZS7ncy1TAFGKhBb5IEouY7Z0OS2fap+lHvrR7E37SnhQHwDazv5ejRJK4wsvmENhW91S2k9tJ7klMOr3tkloqNhNvD3Tr3MooieogN4RJyeCzPuGAOdt4NFoL0+98vhlYHC6Om+STU3qx28uqeIvv4EEKwuW0EcIw2SdG0rIsIXIlS7RZBo+o9GtdyCvAPXed3rWwthOqwvSxsf/OK/SNpDGdoQv+3cxidJ+PQ5nXQqxpzHD2z4zy/ZQ7CB/C531RcIvFIiq/IUTRyAMoWzwSvIB5+XONDXWsI3Pp+Sw2c86iJC/8a3Uvaou9YEcAuNZH4uTiiiLS8WswDptiuhsnpqxfy7IpD153ZtzmG8d4raVICzgIFHxWw7IwDAX0SwWLDYZEY5ZLJQp1DHqGJBLF4CCh+4FHiiWwivfIHz9XYy7jAqa7MYOapKAxAn7e2f2TX1gOHr/y8WTp5b4Yb/GMCvEntYFzdPa2Nr7ByCW0ISZyKj8eC9uRKDaY7KakWk6zzDV3T91AO44
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(83380400001)(76116006)(6506007)(8936002)(53546011)(186003)(26005)(122000001)(38100700002)(38070700005)(86362001)(36756003)(5660300002)(6486002)(8676002)(91956017)(2906002)(316002)(6512007)(33656002)(6916009)(66556008)(64756008)(66446008)(66476007)(2616005)(71200400001)(508600001)(54906003)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F794A02005889F43AEA2401FDCC87F99@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6346
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	300898d1-3749-4f63-e2f2-08d98d5c18c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XG/fBec2mp88daRFy1B35xAF7hoTMlZ8RmtNC4jmFYUZaRSdfJgc27ouKy4wiJyKg5cdP2BWseVb6/1BMQt0jY9R0RE6a3kF0oCXIg48Kw5X5kgxVo8Qzo4tZKe3sdGo1MQB1ndOY5oYg7G5kff7y44kpVp/p4jz0CUrYadBC20kytA7BxKTzMxLa1r0bt9SbeJSSZcBs6cgJGchTHw5JLt6h5KnjDSbjrvnI3iLAlm6WuKsXq9nBTW97eyp+MOlElHJh45AjVK1I0D50nqzQsDRulDgi+0F0pFNPmt8jqqkdioV5My57rYVnklaZtJkpx2sVxyjU9ur8tPHOWfR6FbrBU/TpspjWbSWU1rsN1JPuS5UwEOKuS/7sxxmwEoR3ZUttzcpiKYTiSKhKa/KQMlX3Mts1jHuKcYcK4QkKichxqfY7gmVWmAvTsnkDNM7cMjt/WmNgTAFrwiT9lcPbCahBnACt1jhpbAXDMOMkbDc9mvbX7e02zCWQxF0SdWgi1iPV39ldVNpX3qxcwIueOGqU+G4bAMHAm21ozJtsotwDZ+eDMzkELBuB2Swz1Q5UxaYSUF8EG8CnJOdt1zIg0UsLD/h51Dj3+NSjRda3zbCerryRsAmAsFYzUHOvf2DhWgJoJiWyTZnCzjAjY2iMhiM/qMxKQrY1wRiCKp6i+IAWzcu5TrdyRvwTqazLwSStlr6Zv4M3GPviS0tBK78Fw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(53546011)(47076005)(6862004)(4326008)(70586007)(70206006)(336012)(8936002)(186003)(8676002)(6512007)(36756003)(86362001)(6506007)(2616005)(54906003)(5660300002)(508600001)(36860700001)(33656002)(81166007)(356005)(26005)(107886003)(6486002)(82310400003)(316002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:41:49.9681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4617f27-a836-4c82-9050-08d98d5c2230
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4323

SGkgSmFuLA0KDQo+IE9uIDEyIE9jdCAyMDIxLCBhdCAwOToyOSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDExLjEwLjIwMjEgMTk6MTEsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMTEgT2N0IDIwMjEsIGF0IDE3OjMyLCBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gT24gTW9uLCBPY3QgMTEs
IDIwMjEgYXQgMDI6MTY6MTlQTSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+
IE9uIDExIE9jdCAyMDIxLCBhdCAxNDo1NywgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOg0KPj4+Pj4gSSB0aGluayB0aGUgY29tbWl0IG1lc3NhZ2UgbmVlZHMg
dG8gYXQgbGVhc3QgYmUgZXhwYW5kZWQgaW4gb3JkZXIgdG8NCj4+Pj4+IGNvbnRhaW4gdGhlIGlu
Zm9ybWF0aW9uIHByb3ZpZGVkIGhlcmUuIEl0IG1pZ2h0IGFsc28gYmUgaGVscGZ1bCB0bw0KPj4+
Pj4gZmlndXJlIG91dCB3aGV0aGVyIHdlIHdvdWxkIGhhdmUgdG8gaGFuZGxlIElPIHBvcnQgYWNj
ZXNzZXMgaW4gdGhlDQo+Pj4+PiBmdXR1cmUgb24gQXJtLCBvciBpZiBpdCdzIGZpbmUgdG8ganVz
dCBpZ25vcmUgdGhlbS4NCj4+Pj4gDQo+Pj4+IEFsbCBvdXIgaW52ZXN0aWdhdGlvbnMgYW5kIHRl
c3RzIGhhdmUgYmVlbiBkb25lIHdpdGhvdXQgc3VwcG9ydGluZyBpdA0KPj4+PiB3aXRob3V0IGFu
eSBpc3N1ZXMgc28gdGhpcyBpcyBub3QgYSBjcml0aWNhbCBmZWF0dXJlIChtb3N0IGRldmljZXMg
Y2FuDQo+Pj4+IGJlIG9wZXJhdGVkIHdpdGhvdXQgdXNpbmcgdGhlIEkvTyBwb3J0cykuDQo+Pj4g
DQo+Pj4gSU1PIHdlIHNob3VsZCBsZXQgdGhlIHVzZXJzIGtub3cgdGhleSBhdHRlbXB0ZWQgdG8g
dXNlIGEgZGV2aWNlIHdpdGgNCj4+PiBCQVJzIGluIHRoZSBJTyBzcGFjZSwgYW5kIHRoYXQgdGhv
c2UgQkFScyB3b24ndCBiZSBhY2Nlc3NpYmxlIHdoaWNoDQo+Pj4gY291bGQgbWFrZSB0aGUgZGV2
aWNlIG5vdCBmdW5jdGlvbiBhcyBleHBlY3RlZC4NCj4+PiANCj4+PiBEbyB5b3UgdGhpbmsgaXQg
d291bGQgYmUgcmVhc29uYWJsZSB0byBhdHRlbXB0IHRoZSBoeXBlcmNhbGwgb24gQXJtDQo+Pj4g
YWxzbywgYW5kIGluIGNhc2Ugb2YgZXJyb3IgKG9uIEFybSkganVzdCBwcmludCBhIHdhcm5pbmcg
bWVzc2FnZSBhbmQNCj4+PiBjb250aW51ZSBvcGVyYXRpb25zIGFzIG5vcm1hbD8NCj4+IA0KPj4g
SSB0aGluayB0aGlzIHdvdWxkIGxlYWQgdG8gYSB3YXJuaW5nIHByaW50ZWQgb24gbG90cyBvZiBk
ZXZpY2VzIHdoZXJlIGluDQo+PiBmYWN0IHRoZXJlIHdvdWxkIGJlIG5vIGlzc3Vlcy4NCj4+IA0K
Pj4gSWYgdGhpcyBpcyBhbiBpc3N1ZSBmb3IgYSBkZXZpY2UgZHJpdmVyIGJlY2F1c2UgaXQgY2Fu
bm90IG9wZXJhdGUgd2l0aG91dA0KPj4gSS9PIHBvcnRzLCB0aGlzIHdpbGwgYmUgcmFpc2VkIGJ5
IHRoZSBkcml2ZXIgaW5zaWRlIHRoZSBndWVzdC4NCj4gDQo+IE9uIHdoYXQgYmFzaXMgd291bGQg
dGhlIGRyaXZlciBjb21wbGFpbj8gVGhlIGtlcm5lbCBtaWdodCBrbm93IG9mDQo+IHRoZSBNTUlP
IGVxdWl2YWxlbnQgZm9yIHBvcnRzLCBhbmQgaGVuY2UgbWlnaHQgYWxsb3cgdGhlIGRyaXZlcg0K
PiB0byBwcm9wZXJseSBvYnRhaW4gd2hhdGV2ZXIgaXMgbmVlZGVkIHRvIGxhdGVyIGFjY2VzcyB0
aGUgcG9ydHMuDQo+IEp1c3QgdGhhdCB0aGUgcG9ydCBhY2Nlc3NlcyB0aGVuIHdvdWxkbid0IHdv
cmsgKHBvc3NpYmx5IGNyYXNoaW5nDQo+IHRoZSBndWVzdCwgb3IgbWFraW5nIGl0IG90aGVyd2lz
ZSBtaXNiZWhhdmUpLg0KDQpBcyBFQ0FNIGFuZCBBcm0gZG9lcyBub3Qgc3VwcG9ydCBJL08gcG9y
dHMsIGEgZHJpdmVyIHJlcXVlc3RpbmcgYWNjZXNzDQp0byB0aGVtIHdvdWxkIGdldCBhbiBlcnJv
ciBiYWNrLg0KU28gaW4gcHJhY3RpY2UgaXQgaXMgbm90IHBvc3NpYmxlIHRvIHRyeSB0byBhY2Nl
c3MgdGhlIGlvcG9ydHMgYXMgdGhlcmUgaXMgbm8NCndheSBvbiBhcm0gdG8gdXNlIHRoZW0gKG5v
IGluc3RydWN0aW9ucykuDQoNCkEgZHJpdmVyIGNvdWxkIG1pc2JlaGF2ZSBieSBpZ25vcmluZyB0
aGUgZmFjdCB0aGF0IGlvcG9ydHMgYXJlIG5vdCB0aGVyZSBidXQNCkkgYW0gbm90IHF1aXRlIHN1
cmUgaG93IHdlIGNvdWxkIHNvbHZlIHRoYXQgYXMgaXQgd291bGQgYmUgYSBidWcgaW4gdGhlIGRy
aXZlci4NCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQo+IA0KDQo=

