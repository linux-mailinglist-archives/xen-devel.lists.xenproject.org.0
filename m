Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC2C7B9B77
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 09:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612860.952997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoJ2O-0004ws-GL; Thu, 05 Oct 2023 07:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612860.952997; Thu, 05 Oct 2023 07:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoJ2O-0004uQ-DB; Thu, 05 Oct 2023 07:44:48 +0000
Received: by outflank-mailman (input) for mailman id 612860;
 Thu, 05 Oct 2023 07:44:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCsR=FT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qoJ2M-0004uK-Io
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 07:44:46 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d5a67cc-6353-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 09:44:45 +0200 (CEST)
Received: from AS8PR04CA0048.eurprd04.prod.outlook.com (2603:10a6:20b:312::23)
 by AS8PR08MB9977.eurprd08.prod.outlook.com (2603:10a6:20b:636::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Thu, 5 Oct
 2023 07:44:42 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::d6) by AS8PR04CA0048.outlook.office365.com
 (2603:10a6:20b:312::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35 via Frontend
 Transport; Thu, 5 Oct 2023 07:44:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.24 via Frontend Transport; Thu, 5 Oct 2023 07:44:42 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Thu, 05 Oct 2023 07:44:41 +0000
Received: from 0c65e131906d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C987B6E-2CBC-48DD-A571-E0C11295DD70.1; 
 Thu, 05 Oct 2023 07:43:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c65e131906d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Oct 2023 07:43:55 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by AS2PR08MB9269.eurprd08.prod.outlook.com (2603:10a6:20b:59e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 07:43:51 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7d2f:80d6:9244:3266]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7d2f:80d6:9244:3266%6]) with mapi id 15.20.6838.030; Thu, 5 Oct 2023
 07:43:51 +0000
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
X-Inumbo-ID: 0d5a67cc-6353-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDyAJYxtKytiblXKoG464QgdaCKUcx0b2MM6mQniOAE=;
 b=fKVlgi5M90ZYWK6en6y4vrwrJYypYPjVW7M86P9BhS0YBekFvu1ygoJ5o7hv8kT5KNAiG2dtQUPBBFrY+RpIvvf+AH7T1UfrlHCMkc7KCkKNR5F+/TQrTawmKMkE7yX52xaJQxmRM+IiKnescRUi4ptteeOftUq5Q/Jt0ICXhIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32d1ea1f3eb415bb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iw+aGVnr6imFOMbRA+27bKVsW+EC0VMudSDxvvJf98xv4tb/DMlQQn/bOWU/ot1o9OLaLOfxEaLWcfiMyyREVgweigKQ9fOqYO8fXt5ck4P+4+wh6AlNxXE83TeU5Mj6wLbWmRjvHW1YvQfuzFsYIQYhOLk4UYGha/lwfsETi+nbNQdKpVzOXWmXkNDXm5lOHZFjamV+QI5J/m1zUesLHarNM+Ma6BbIhuDzuLNOIjmJogNLBN8Qoq7HLu821v6hSw0hYdiagYpoJjC0NRgCYHa5G52SBFz++bC0KxduLb7CoEHam7Z3YtDsOJ205yYdj32SmexPHVrjmgL40jewGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDyAJYxtKytiblXKoG464QgdaCKUcx0b2MM6mQniOAE=;
 b=JKNQZo09EcvavQWWKfNlAQBO2qxhjBOYpDdm2zmwjlCgWFSwF8HI4oI1Cllus3rFk1aV+/q3sGcEFBW6vArzMyTBCBXuadOTEphhzheq8/4w5f0evBJ6tqS1wj6auYsIitKQiE1J61iH4yYrCyOdBih5VUIyg0A3hM9dGlGwYajbOESjoOGCzaarpAe/LSYx8KG+i6VHfq2TNEbzEutUHR6X2NEyVOW5anlJtUXBfI9o6W84kBbPANGPSKl2ZPABdtDrb77QWXrIb5NZ781L0/1sCi7EMNj2oU9gwEgoGzeQXvgs5sWW69BIyFC+mW5JajmMmPkQ4beUJmPcl1/UAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDyAJYxtKytiblXKoG464QgdaCKUcx0b2MM6mQniOAE=;
 b=fKVlgi5M90ZYWK6en6y4vrwrJYypYPjVW7M86P9BhS0YBekFvu1ygoJ5o7hv8kT5KNAiG2dtQUPBBFrY+RpIvvf+AH7T1UfrlHCMkc7KCkKNR5F+/TQrTawmKMkE7yX52xaJQxmRM+IiKnescRUi4ptteeOftUq5Q/Jt0ICXhIA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: SAF-x-safe rename
Thread-Topic: SAF-x-safe rename
Thread-Index: AQHZ9x0f2i/5rB9iCkSEJyJjGzwZKrA60RYA
Date: Thu, 5 Oct 2023 07:43:51 +0000
Message-ID: <9CF5DF50-B857-4B1D-A210-E6355492CC3B@arm.com>
References:
 <alpine.DEB.2.22.394.2310041633080.2348112@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310041633080.2348112@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|AS2PR08MB9269:EE_|AM7EUR03FT025:EE_|AS8PR08MB9977:EE_
X-MS-Office365-Filtering-Correlation-Id: f5dbd1f9-fbe7-4380-4150-08dbc576efb7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nQQw93oj/xaVjcCnxWqavqCAeBoKt0VcJjtLKGnZ+9PzucPp46PiEsw/fJtoVQDEtAhh+arqoEl0m6r05qfteCi1LP4mYc5aZUqHY2jmh95mEh2yEghwqSNMUEKrBLX4KrUmjO7X7cVUDKlqyLXtzlbP0biC59YfdCjCBCpr4BTFOAa5WvHOakR5YhHdqdlPkoKGXTNWOQbptLIISBiUPV10y91P6nLQUv/xQW2zx6/CTuPdDNDqKlBIV46mc2oyyoY0RBV9M7HFg2tq9XYOzZ4TRsPf/MEHxG5DLmKN/yPzTJ4J2bik01auSDmZiJWoFL/lHS7WGaHfTNxo1g8z9ZopNR71HLofASV3xvgbBBWc1l18nvt4oZ4eK5zherfquan+yfsBV5wAkoFtJXv7Wo45GvUuelPYGBB/IjWsmyggU5XgxTxCi5sgRC+9GEQ86w+C0GnHyGifrFjIUuiA5NswKlVxusT/09Lsb1n9OwibH/EKfesZO1o4B2FQrCPuWcS1oxzBzbcMb57yoBCBSqmqNsaLaaPR8Yn0yhD0rffmf7e/Ru048jHeHSzNE6wEy8sK/cMYuoBnPvX+pRYo8VBVxM/ZYhvM5Omdd2MZff/kw5ddpvuWKHbBeZgn9Vpm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(26005)(2616005)(71200400001)(83380400001)(64756008)(4326008)(33656002)(41300700001)(5660300002)(8936002)(54906003)(66556008)(66446008)(66476007)(66946007)(6916009)(8676002)(316002)(91956017)(2906002)(76116006)(478600001)(6512007)(6506007)(6486002)(53546011)(966005)(36756003)(38070700005)(38100700002)(122000001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <998CC4F72A4964469698ED94D60E4E15@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9269
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0c4c1ed-692a-4995-94c9-08dbc576d154
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Au1iD+xvZ3fOtqdEmg3zf8S5DZ1uCnUe2xFtAqMZysNzoYyWuBfau26ubh1hNlpvpwKpWJbq2A2YuBTR5p7B4QE+9UDMC3/RLS7zOC7hieFTsPqOufW06AbaeLekKKpTE7MRlEcWaEnPaeI6qu4jbdMh6DFofGXXPL9IcQR8T+wW4J8sHcQifSp4FExkOltXXc5hPiyZI/3TsRiMdKM1zTbKTHpP7l4r6YDTzj9fLCCnVzM+cGN6m84gLquFW9VPa0puH0bAcEYP7qlPW+9MvQx6tGGqhsMFEGBQ3G/LJmzXwGxItBxqRgh3jv9vOh0/OjYQ/xyAsTrwyRrcLOUIJmaZmUz8ZQI3SNYq/NQQNbAVfquU20SmncW/X9H2Cj1YEJ/H/BaFJvp4bjwks9Hh5TDrYOJiE6N1soRMx69gqFU1QB4DkZftZx6abhFgTOhru4+/QSY2aHc74eBtTR0g3BwkhUsQ5rI+nxP7LJ+Pu1NwzOxdsvsjFJbL9jLg8xQkEPvDtL3kcLvBHe0/RpKqSIUONs5uU6mT8cyFIBuyGsUYxdwbU/eLTn1Ae3EOGGX3UP8dr0plGJNoClMd5vBNSgSeuHUd3s+xiP12/b26kKXZd6F1ZrW/RTYqo5OKUVCibnkBDaDdSCmkybWP5FFAAIM5GgVo8ZY7n0T8K9Ec7pO/XWPzIlAwKtCVLfrhYnx0C6x0v++4vvES1gNapuTC2eo3Ja/7wT+MRjo6B4abJUM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(336012)(6512007)(40460700003)(40480700001)(81166007)(6506007)(966005)(6486002)(478600001)(83380400001)(47076005)(86362001)(356005)(53546011)(82740400003)(36860700001)(8936002)(41300700001)(2616005)(26005)(4326008)(70206006)(2906002)(8676002)(6862004)(5660300002)(316002)(70586007)(54906003)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 07:44:42.1165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5dbd1f9-fbe7-4380-4150-08dbc576efb7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9977

DQoNCj4gT24gNSBPY3QgMjAyMywgYXQgMDA6NDYsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBNSVNSQSBDIHdvcmtpbmcgZ3JvdXAg
KEphbiwgUm9nZXIsIEFuZHJldywgSnVsaWVuLCBCZXJ0cmFuZCwgR2VvcmdlKQ0KPiANCj4gaW4g
YSByZWNlbnQgdGhyZWFkIEFuZHJldyBwb2ludGVkIG91dCB0aGF0IHRoZSBTQUYtMi1zYWZlIHRh
ZyBpcw0KPiBjb25mdXNpbmcgYW5kIHJlcXVlc3RlZCBhIHJlbmFtZToNCj4gaHR0cHM6Ly9tYXJj
LmluZm8vP2w9eGVuLWRldmVsJm09MTY5NjM0OTcwODIxMjAyDQo+IA0KPiBBcyBkb2N1bWVudGVk
IGJ5IGRvY3MvbWlzcmEvZG9jdW1lbnRpbmctdmlvbGF0aW9ucy5yc3Q6DQo+IA0KPiAtIFNBRi1Y
LXNhZmU6IFRoaXMgdGFnIG1lYW5zIHRoYXQgdGhlIG5leHQgbGluZSBvZiBjb2RlIGNvbnRhaW5z
IGEgZmluZGluZywgYnV0DQo+ICAgdGhlIG5vbiBjb21wbGlhbmNlIHRvIHRoZSBjaGVja2VyIGlz
IGFuYWx5c2VkIGFuZCBkZW1vbnN0cmF0ZWQgdG8gYmUgc2FmZS4NCj4gLSBTQUYtWC1mYWxzZS1w
b3NpdGl2ZS08dG9vbD46IFRoaXMgdGFnIG1lYW5zIHRoYXQgdGhlIG5leHQgbGluZSBvZiBjb2Rl
DQo+ICAgY29udGFpbnMgYSBmaW5kaW5nLCBidXQgdGhlIGZpbmRpbmcgaXMgYSBidWcgb2YgdGhl
IHRvb2wuDQo+IA0KPiANCj4gVG9kYXkgd2UgaGF2ZSBhbHJlYWR5IDI4IGluc3RhbmNlcyBvZiBT
QUYgdGFncyBpbiB0aGUgWGVuIGNvZGViYXNlLg0KPiANCj4gDQo+IEFuZHJldyBzdWdnZXN0ZWQg
IkFOQUxZU0lTIiBpbnN0ZWFkIG9mIFNBRiBzbyBJIHdvdWxkIGltYWdpbmU6DQo+IC0gQU5BTFlT
SVMtWC1zYWZlDQo+IC0gQU5BTFlTSVMtWC1mYWxzZS1wb3NpdGl2ZS08dG9vbD4NCj4gDQo+IElm
IHdlIHJlYWxseSB3YW50IGEgcmVuYW1lIEkgc3VnZ2VzdCB0byByZW5hbWUgU0FGIHRvIFNBRkU6
DQo+IC0gU0FGRS1YLXNhZmUNCj4gLSBTQUZFLVgtZmFsc2UtcG9zaXRpdmUtPHRvb2w+DQo+IA0K
PiBPciBtYXliZSBNSVNSQToNCj4gLSBNSVNSQS1YLXNhZmUNCj4gLSBNSVNSQS1YLWZhbHNlLXBv
c2l0aXZlLTx0b29sPg0KPiANCj4gQnV0IEkgYWN0dWFsbHkgcHJlZmVyIHRvIGtlZXAgdGhlIHRh
ZyBhcyBpdCBpcyB0b2RheS4NCg0KV2UgY2hvc2UgYSBnZW5lcmljIG5hbWUgaW5zdGVhZCBvZiBN
SVNSQSBiZWNhdXNlIHRoZSB0YWcgY2FuIHBvdGVudGlhbGx5IHN1cHByZXNzIGZpbmRpbmdzDQpv
ZiBhbnkgY2hlY2tlciwgaW5jbHVkaW5nIE1JU1JBIGNoZWNrZXIuDQoNCklmIFNBRi0qIGlzIGNv
bmZ1c2luZywgd2hhdCBhYm91dCBGVVNBLSogPw0KDQpBbnl3YXkgSeKAmW0gdGhpbmtpbmcgdGhh
dCBldmVyeSBuYW1lIHdlIGNvdWxkIGNvbWUgdXAgd2lsbCBiZSBjb25mdXNpbmcgYXQgZmlyc3Qs
IGltcHJvdmluZyB0aGUNCmRvY3VtZW50YXRpb24gd291bGQgbWl0aWdhdGUgaXQgKGJ5IGltcHJv
dmluZyBJIG1lYW4gdG8gaW1wcm92ZSB0aGUgZnJ1aXRpb24gb2YgaXQsIGZvciBleGFtcGxlIGEN
ClJlYWQgdGhlIGRvY3MgZG9jdW1lbnRhdGlvbiBoYXMgdGhlIHNlYXJjaCBiYXIsIGEgcXVpY2sg
Y29weSBwYXN0ZSBvZiBTQUYtIHdvdWxkIG1ha2UgdGhlDQpkb2N1bWVudGluZy12aW9sYXRpb25z
IHBhZ2UgdmlzaWJsZS4pDQoNCj4gDQo+IA0KPiBJZiB5b3UgaGF2ZSBhbnkgbmFtaW5nIHN1Z2dl
c3Rpb25zIHBsZWFzZSBsZXQgbWUga25vdyBieSBPY3QgMTEuIEFmdGVyDQo+IHRoYXQsIEkgcGxh
biB0byBydW4gYSBEb29kbGUgcG9sbCB0byBjaGVjayB0aGUgcHJlZmVyZW5jZSBvZiB0aGUgZ3Jv
dXAuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBTdGVmYW5vDQo+IA0KDQo=

