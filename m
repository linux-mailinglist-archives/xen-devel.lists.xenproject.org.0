Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935EA7AE347
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 03:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608239.946597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkwn5-0004Sm-P1; Tue, 26 Sep 2023 01:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608239.946597; Tue, 26 Sep 2023 01:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkwn5-0004QX-Lk; Tue, 26 Sep 2023 01:23:07 +0000
Received: by outflank-mailman (input) for mailman id 608239;
 Tue, 26 Sep 2023 01:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQH+=FK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkwn4-0004QR-4S
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 01:23:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c2047e2-5c0b-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 03:23:02 +0200 (CEST)
Received: from DU2PR04CA0229.eurprd04.prod.outlook.com (2603:10a6:10:2b1::24)
 by PA4PR08MB5968.eurprd08.prod.outlook.com (2603:10a6:102:e9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 01:22:56 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::1f) by DU2PR04CA0229.outlook.office365.com
 (2603:10a6:10:2b1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 01:22:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Tue, 26 Sep 2023 01:22:56 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Tue, 26 Sep 2023 01:22:55 +0000
Received: from b51084378359.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD74DB4C-70E8-41D6-AAFD-FFB4BBAE0DE4.1; 
 Tue, 26 Sep 2023 01:22:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b51084378359.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Sep 2023 01:22:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8267.eurprd08.prod.outlook.com (2603:10a6:10:3c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 01:22:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 01:22:40 +0000
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
X-Inumbo-ID: 3c2047e2-5c0b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BT+6fsnEkJ6JZvZHojF93bIJVFm5eWHfBnsMyJDuFVc=;
 b=5h1vL8Tdj3m8hdNhSKyzDvFuq0OGE/74HzzPsBm0Rxst79Bmifv7itE9c01sKl1HayamUx6Re/Xwykl+pEvmtjpNf0VvtJP2QLhTCpxuVU2FTiTefpOGHELNt4caLd+W14d1Q3wcDatLos8LgocF/Bpd/d1wwZn4T+n1M9nsu94=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14dbabfbb64c1615
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mS3OnJNu2T4SQa4HvOTecvHGWnv5JgSiYjwuh+dHw8+QTQIDlxubwHGm+rg1zAu2WlkXdZcXuvJ+2Ujww9ZNSSb+03fEp6dwkHRYPYem6La+Y/Gx45sPAO59lBl2ALjhnLwVLGTT2PHseZAZfV5W3uhU7rsDU3So2NC+tYpEaX52N/NI8rBTUv0ZP8GI1veXKtywFCmKiX7C4gm2a+UckUSzDvd/vSr/tSg8Iz0RfdCPLOFL7IBX0TgVXD03P0t2zBc6cJRB7q9rovbbeR+PRtvVO67AH3f9js8xcXXSk2ee0oLxhMYBmgqbf3lNCtonS8JuJoRJi20p9KtHuorHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BT+6fsnEkJ6JZvZHojF93bIJVFm5eWHfBnsMyJDuFVc=;
 b=di398i6Gycpqmvnv7Vp1gG5+upVpdoCNmcrRYpAyoArKn4WZqVVsZ9fI2HSW2CtuihrZV5zd3+Fg443Pe2itvm5Hkz0kiA8qiQcBMX77rI6XuZ3eERNhZOrz/vck/TpaSX9TQPOMQy33U/00TzuOS0cE9Krv1HcRiBHivJMlJGzEMDmn9BwKwHxA/SlydwbR5H+JPMunDJURYXdgK2iioqtvgzXAWVgOiRqsAvlAhUZVV98gTk1b217RZc2j08mfC7Ax9pa6INkIePclkB/ADbHZt3k+aTEJ+empJ6TkyfPVhyuWp47uRmA20KHtvm2cBjS/04XbETrdaTf5cGboTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BT+6fsnEkJ6JZvZHojF93bIJVFm5eWHfBnsMyJDuFVc=;
 b=5h1vL8Tdj3m8hdNhSKyzDvFuq0OGE/74HzzPsBm0Rxst79Bmifv7itE9c01sKl1HayamUx6Re/Xwykl+pEvmtjpNf0VvtJP2QLhTCpxuVU2FTiTefpOGHELNt4caLd+W14d1Q3wcDatLos8LgocF/Bpd/d1wwZn4T+n1M9nsu94=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v6 06/13] xen/arm: Split page table related code to
 mmu/pt.c
Thread-Topic: [PATCH v6 06/13] xen/arm: Split page table related code to
 mmu/pt.c
Thread-Index: AQHZ2U+aje2PKtXU80iuXwonhzBTpLAsEaAAgABrlgA=
Date: Tue, 26 Sep 2023 01:22:40 +0000
Message-ID: <D2229788-EBA1-4FFF-9074-7603C1719F08@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-7-Henry.Wang@arm.com>
 <48bb2e22-ba78-4f45-9783-d9e5f83e75d8@xen.org>
In-Reply-To: <48bb2e22-ba78-4f45-9783-d9e5f83e75d8@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB8267:EE_|DBAEUR03FT019:EE_|PA4PR08MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 87797ccb-0506-4c1e-3768-08dbbe2f1cdd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yS354MuPvJJrcsuYcPkN4OtixUiS8zu8tAOuDrzncoSnk8usOtAttTbyMd6nvDQRQ8u5evDr08n0djVQPMqAuuQXSfMlO1M+r65H15M14yxhMlhm1IvuIlJiRXEdtOZFeSQl2GnTnRV0he26hX9h7bXFdG2OkpDCzuMvJGMIWEZT8t0Ydh80xfY7+FCwsYB9jVpIb2SaEkcQHk6ODAjYmyp2K6H1G0fi0ucTYbQPIFJdZ0qCmGNbZ36yqyEBwNBoBW+uJlL7xcmjM6dixI7di3zJJQvvyMtS84b9ojoqBvrkQ6YtZRJX1GKEPVFD81zYemcEGtEvmaef6GcTFvUW8xN/92xvCKWLSJxu3Qa6NJj1fuxV5vnEaC6WxDZtL6f1Uw+9Sq1dcmUR8bA2/qIA0gjAXxJ/N0LZa+7P+EYpIIz4gUbAi0tUZTIXlzoK+SA/DwjLdwpTMktcBWqNZxRgOy36ZLJB6X1dIPoPUggPdEJOIIJR4zBD0VML3Sp7hE904tXoHAgHQ9JVKlfTB6t0KoKFZnocbRAaTZsGmVWFzzmA+Qm8EZBeUu+yTrcTQuE93AaMn9IO7vlEBpaV2cfmCScTsFZ/tfhMdVYOliR1R4+0Gr+cEomPkBBJll2U+BfLNSl4oiXNtpjJxz4sKj6c9Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(451199024)(1800799009)(186009)(8936002)(8676002)(4326008)(26005)(2906002)(91956017)(478600001)(41300700001)(64756008)(66556008)(316002)(6916009)(76116006)(66446008)(66476007)(54906003)(66946007)(5660300002)(6486002)(6506007)(71200400001)(53546011)(6512007)(36756003)(2616005)(83380400001)(38070700005)(122000001)(38100700002)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B8DADCB6D84A34C9908EA5B07690C6F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8267
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80bfcaf8-6a34-4430-a677-08dbbe2f13c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zSXncMy3YY2IhSK8oi7+DZ+5rtVCXqLq2tkWDBEaMjuS5QJGV7lrEycaPWUKaov5RHHu0cSEQYxWid8S41XNnZgRE1KpZGQBvwL748G3Cx5alUWxk91gj6j/rZk3oN9a7zPR7LBp8R67gpC5VH5ePHGlWZDQcpLeLcL5RClJU2ImF+9L1TzqX+PpJrDCuK1gz5Aumzes6szJEGfPVKAaHEth3hRvRiW1UvTpvXbXFLKElFmlC63EhyN4SyLP25EM9pWTF6LkQ4maBAQtwBGQd9lQWqBxY+Te126PGknC1RYD1N2is+9DV2hpx8Bv3J2KxzYeFVNaQjj1vuKytxz9md2kXFgXTPuucLyVcAIHBdbqZujuKCNNzN0G3YJu1065vibsmcFe1bTbMkWPy7goCN+/aDmoiCIp2sSR4xbVjs9pUjyQqpS1sxOVNZV+0k/xoNYPFCHEb7V3cs1KBSc/mv7RcNpaWeMr6EFGfTwJhsUdUQXI25MbBPG1G7/jaEe6h2sgb6S7FpeFmoEmNk7QOBZU9Y911ZPioG3CiBAWya5rK5Z2ZgBnd4nLIxyt+KGM35x/h2r09tMM6EYSzfe+af4PNzP0P5kAkC16CfZ3MDJv1rckmEQuzA/2nvckxf+OiwY77VOe3oC9jDbJ0OxGM+eD4FnAcxmqelHyEU1GfNgUN+edljouvKNUejVtnDIJLwsHEjnfu11ZRsd3SxPZLddzxhEMv51XrycneOy+cQG71LJ6WUQ8eS6UKRC/r+Qt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(82310400011)(186009)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(6512007)(53546011)(6506007)(6486002)(83380400001)(356005)(82740400003)(81166007)(33656002)(86362001)(36860700001)(47076005)(36756003)(2616005)(26005)(336012)(40480700001)(2906002)(41300700001)(316002)(70206006)(8936002)(70586007)(54906003)(478600001)(4326008)(6862004)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 01:22:56.0057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87797ccb-0506-4c1e-3768-08dbbe2f1cdd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5968

SGkgSnVsaWVuLA0KDQo+IE9uIFNlcCAyNiwgMjAyMywgYXQgMDI6NTcsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBJIGhhdmVuJ3Qg
Y2hlY2tlZCB0aGF0IHRoZSBjb2RlIG1vdmVtZW50IGlzIGp1c3QgYSBjb2RlIG1vdmVtZW50LiBG
b3Igbm93LCBJIGFtIG1haW5seSBsb29raW5nIGF0IHRoZSBzcGxpdC4NCg0KTm8gcHJvYmxlbSwg
dGhhbmsgeW91LiBJIHdpbGwgcmViYXNlIHY2IGFuZCB1c2UgdGV4dCBjb21wYXJpc29uIHRvb2xz
DQp0byBjaGVjayBpZiB0aGUgY29kZSBtb3ZlbWVudCBpcyBqdXN0IGNvZGUgbW92ZW1lbnQgYmVm
b3JlIHNlbmRpbmcgdjcNCnRvIG1ha2Ugc3VyZSBJIHdvbuKAmXQgbWFrZSB0aGUgc2FtZSBtaXN0
YWtlIGFnYWluLiBZb3UgY2FuIGRvdWJsZSBjaGVjaw0KdGhlIGZpbmFsIHZlcnNpb24uIA0KDQo+
IA0KPiBPbiAyOC8wOC8yMDIzIDAyOjMyLCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gVGhlIGV4dHJh
Y3Rpb24gb2YgTU1VIHJlbGF0ZWQgY29kZSBpcyB0aGUgYmFzaXMgb2YgTVBVIHN1cHBvcnQuDQo+
PiBUaGlzIGNvbW1pdCBzdGFydHMgdGhpcyB3b3JrIGJ5IGZpcnN0bHkgc3BsaXR0aW5nIHRoZSBw
YWdlIHRhYmxlDQo+PiByZWxhdGVkIGNvZGUgdG8gbW11L3B0LmMsIHNvIHRoYXQgd2Ugd2lsbCBu
b3QgZW5kIHVwIHdpdGggYWdhaW4NCj4+IG1hc3NpdmUgbW0uYyBmaWxlcy4NCj4+IEludHJvZHVj
ZSBhIG1tdSBzcGVjaWZpYyBkaXJlY3RvcnkgYW5kIHNldHVwIHRoZSBNYWtlZmlsZXMgZm9yIGl0
Lg0KPj4gTW92ZSB0aGUgcGFnZSB0YWJsZSByZWxhdGVkIGZ1bmN0aW9ucyBhbmQgbWFjcm9zIGZy
b20gYXJjaC9hcm0vbW0uYw0KPj4gdG8gYXJjaC9hcm0vbW11L3B0LmMuIEV4cG9zZSB0aGUgcHJl
dmlvdXNseSBzdGF0aWMgZ2xvYmFsIHZhcmlhYmxlDQo+PiAicGh5c19vZmZzZXQiLg0KPiANCj4g
SSBkb24ndCBtdWNoIGxpa2UgdGhlIGlkZWEgdG8gZXhwb3NlIHBoeXNfb2Zmc2V0IGV2ZXJ5d2hl
cmUuIExvb2tpbmcgYXQgdGhlIGNvZGUgdGhlcmUgYXJlIHR3byB1c2VyczoNCj4gICogcHRlX29m
X3hlbmFkZHIoKTogSSByZWFsaXplIHlvdSBzdWdnZXN0ZWQgdG8gYWRkIGl0IGluIHB0LmMgYW5k
IEkgYWdyZWVkLiBIb3dldmVyLCBsb29raW5nIGF0IHRoZSBzcGxpdCwgdGhpcyBmdW5jdGlvbiBp
cyBleGNsdXNpdmVseSB1c2VkIGZvciBib290IChhbmQgeW91IGNvbmZpcm1lZCBiZWxvdykuIFNv
IEkgdGhpbmsgaXQgd291bGQgYmUgcHJlZmVyYWJsZSB0byBtb3ZlIGl0IGluIG1tdS9zZXR1cC5j
Lg0KDQpTb3VuZHMgZ29vZCwgSSB3aWxsIGZpeCB0aGlzIGluIHY3Lg0KDQo+ICAqIHByZXBhcmVf
c2Vjb25kYXJ5X21tKCk6IEkgdGhpbmsgd2UgY291bGQgc3dpdGNoIHRvIHZpcnRfdG9fbWZuKCku
DQoNCkFjdHVhbGx5IEkgZm91bmQgdGhlIHRoaXJkIHVzZSBvZiBwaHlzX29mZnNldCBpbiBzZXR1
cF9wYWdldGFibGVzKCksIGJ1dCBpdA0KbG9va3MgbGlrZSB0aGUgdXNhZ2UgaXMgc2ltaWxhciBh
cyB0aGUgdXNhZ2UgaGVyZSwgc28gcHJvYmFibHkgdGhlc2UgdHdvDQphcmUgdGhlIHNhbWUgY2Fz
ZS4NCg0KQWxzbywgcGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZywgYnkgc3VnZ2VzdGlu
ZyB0aGUg4oCcc3dpdGNo4oCdLCBkbyB5b3UNCm1lYW4gdXNpbmcgdmlydF90b19tZm4oKSBvbiB4
ZW5fcGd0YWJsZSB0byBjaGFuZ2UgaXQgdG8gbWluLCB0aGVuIGNoYW5nZQ0KdGhlIG1mbiB0byBQ
QSBhbmQgZGVsZXRlIHRoZSBwaHlzX29mZnNldD8gSWYgc28sIHdoeSBub3QgdXNlIHZpcnRfdG9f
bWFkZHIoKT8gDQoNCj4gDQo+IEkgY2FuIHVuZGVyc3RhbmQgaWYgeW91IGRvbid0IHdhbnQgdG8g
bWFrZSB0aGUgc2Vjb25kIGNoYW5nZS4gU28gSSB3b3VsZCBhdCBsZWFzdCByZXF1ZXN0IHRvIC4u
Lg0KPiANCj4+IFdoaWxlIG1vdmluZywgbWFyayBwdGVfb2ZfeGVuYWRkcigpIGFzIF9faW5pdCB0
byBtYWtlIGNsZWFyIHRoYXQNCj4+IHRoaXMgaGVscGVyIGlzIG9ubHkgaW50ZW5kZWQgdG8gYmUg
dXNlZCBkdXJpbmcgZWFybHkgYm9vdC4NCj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGZpeCB0
aGUgaW4tY29kZSBjb21tZW50IGNvZGluZyBzdHlsZXMgd2hlbg0KPj4gcG9zc2libGUsIGFuZCBk
cm9wIHRoZSB1bm5lY2Vzc2FyeSAjaW5jbHVkZSBoZWFkZXJzIGluIHRoZSBvcmlnaW5hbA0KPj4g
YXJjaC9hcm0vbW0uYy4NCj4+IFNpZ25lZC1vZmYtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdA
YXJtLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0u
Y29tPg0KPj4gLS0tDQo+PiB2NjoNCj4+IC0gUmV3b3JrIHRoZSBvcmlnaW5hbCBwYXRjaCAiW3Y1
LDA3LzEzXSB4ZW4vYXJtOiBFeHRyYWN0IE1NVS1zcGVjaWZpYw0KPj4gICBjb2RlIiwgb25seSBz
cGxpdCB0aGUgcGFnZSB0YWJsZSByZWxhdGVkIGNvZGUgb3V0IGluIHRoaXMgcGF0Y2guDQo+PiAt
LS0NCj4+ICB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICB8ICAgMSArDQo+PiAgeGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL21tLmggfCAgIDIgKw0KPiANCj4gLi4uIGRlY2xhcmUgcGh5c19v
ZmZzZXQgaW4gYXNtL21tdS9tbS5oIGJlY2F1c2UgdGhpcyB2YXJpYWJsZSBkb2Vzbid0IG1ha2Ug
YSBsb3Qgb2Ygc2Vuc2Ugd2hlbiB0aGUgTVBVIGlzIHVzZWQgKGl0IHdpbGwgYWx3YXlzIGJlIGVx
dWFsIHRvIDApLg0KPiANCj4gVGhlIHJlc3Qgb2YgdGhlIHNwbGl0IGxvb2tzIGdvb2QgdG8gbWUu
DQoNClRoYW5rcyBmb3IgY29uZmlybWluZywgSSB3aWxsIHNlZSB3aGF0IHRoZSBhYm92ZSBkaXNj
dXNzaW9uIGVuZHMgYW5kIHRoZW4NCmRvIHRoZSBjaGFuZ2UgYWNjb3JkaW5nbHkuDQoNCj4gDQo+
IA0KPiBbLi4uXQ0KPiANCj4+IC1scGFlX3QgcHRlX29mX3hlbmFkZHIodmFkZHJfdCB2YSkNCj4+
IC17DQo+PiAtICAgIHBhZGRyX3QgbWEgPSB2YSArIHBoeXNfb2Zmc2V0Ow0KPj4gLQ0KPj4gLSAg
ICByZXR1cm4gbWZuX3RvX3hlbl9lbnRyeShtYWRkcl90b19tZm4obWEpLCBNVF9OT1JNQUwpOw0K
Pj4gLX0NCj4+IC0NCj4gDQo+IFNlZSBhYm92ZS4gSSB0aGluayB0aGlzIHNob3VsZCBzdGF5IGhl
cmUgZm9yIG5vdyBhbmQgdGhlIGJlIG1vdmVkIHRvIHNldHVwLmMgaW4gYSBmb2xsb3ctdXAgcGF0
Y2guDQoNClN1cmUuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4g
DQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

