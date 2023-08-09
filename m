Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906FA77612A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 15:35:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581095.909631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjLN-0003aU-A9; Wed, 09 Aug 2023 13:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581095.909631; Wed, 09 Aug 2023 13:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjLN-0003Y4-70; Wed, 09 Aug 2023 13:35:21 +0000
Received: by outflank-mailman (input) for mailman id 581095;
 Wed, 09 Aug 2023 13:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmRr=D2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTjLM-0003Xy-4W
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 13:35:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93820e20-36b9-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 15:35:17 +0200 (CEST)
Received: from AS8P189CA0047.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::27)
 by PAVPR08MB9040.eurprd08.prod.outlook.com (2603:10a6:102:32d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 13:35:13 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:458:cafe::a) by AS8P189CA0047.outlook.office365.com
 (2603:10a6:20b:458::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Wed, 9 Aug 2023 13:35:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Wed, 9 Aug 2023 13:35:13 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Wed, 09 Aug 2023 13:35:13 +0000
Received: from df7c8f155ca6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C30309F-0116-4FE1-939F-B53627B27A08.1; 
 Wed, 09 Aug 2023 13:34:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df7c8f155ca6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Aug 2023 13:34:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB7592.eurprd08.prod.outlook.com (2603:10a6:10:311::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 13:34:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 13:34:46 +0000
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
X-Inumbo-ID: 93820e20-36b9-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JE+zwnNBEWcZY3KByuvoYBwueGKBwPSlNOUFMVG6wK4=;
 b=gDDrGV1uegTltK81PO9SknLNgGLGxLTecWsI3ht6zyiVoLGe9ZAwGa8QL3siHPIrNoMtpekNtKMqNEMp4zmtaiRSMzppBbc7VDeuUqDyHzlYx7y0s+RF5rLBy08F8hFa47WYglNzIA0I1GBdYWfK3MUpB+FnZsCne50qksX7hHQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e18648eb2eff96a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpKaMvL0YW0ckNkAGvol/P4igcjU7HmomIgGjPDc1Y8ZTusG/6el1SEBpzA/vaLL05155Y963wMf/GUgNNsVphgpTnHuLfPx6IshKkvHXp3dcXLQf4t6/ZYvAmbOeEvViSQuddcojwiwu2gUqXcvGz5fJFDz605XZlGuhYRp1AQvBi+RbP6hLz6xbvIyyAwv4dS9MUx/DoCWorBusC14kCWIASyHeU4cVQShRAHtvytamLyKUdXSlYSfWgZ1V9qbDwrH/GxrTmoT/O7a7Jxj/g5BHkEJMVikxvfqGf8fvD/vMpFK/oKhbCVxnXNULvq/UjQVwlSYHEUvKC79zVpzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JE+zwnNBEWcZY3KByuvoYBwueGKBwPSlNOUFMVG6wK4=;
 b=d0AUKmGi3bkUHVtFd6hkTkPolOEZMAjfkMa/fLM1OXIUMXxHa4Czkw+nsQEx8rvEnIfV8JXWIW9tyTXTnmYYkDcQSciBUCsB75aYolZ8vuTRXqtDUunaZ/3ZwWu3idY9mm6hBgVnblBT5ZSMyd1YUsNnjHzkZODIc2gpGgB43QrHxpdgZft0tMaXy/eNUY6kYVITip7QMpDfAmThIP9RfySjxe2I3obN5VO5RNImb8tGPtYIYYfoUCtexcOBUtnzgMg6VMUGiG+kPXusjdq3PCDZIChVWk7ka8ENVNHjQszCCDIOh+dvL4wONJooAzrvDW6z4agUrnJue1lsy9DOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JE+zwnNBEWcZY3KByuvoYBwueGKBwPSlNOUFMVG6wK4=;
 b=gDDrGV1uegTltK81PO9SknLNgGLGxLTecWsI3ht6zyiVoLGe9ZAwGa8QL3siHPIrNoMtpekNtKMqNEMp4zmtaiRSMzppBbc7VDeuUqDyHzlYx7y0s+RF5rLBy08F8hFa47WYglNzIA0I1GBdYWfK3MUpB+FnZsCne50qksX7hHQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH 2/8] xen/memory: address MISRA C:2012 Rule 8.4
Thread-Topic: [XEN PATCH 2/8] xen/memory: address MISRA C:2012 Rule 8.4
Thread-Index: AQHZyrEh5sKZJy8ET0extcxfAe4LeK/h9xaA
Date: Wed, 9 Aug 2023 13:34:46 +0000
Message-ID: <2AD1EA83-AE7F-485C-ABFA-D285B4BAB1CC@arm.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <844e7bf57c2eb7b20d8b1f81a7730a7612f1b6ac.1691575243.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <844e7bf57c2eb7b20d8b1f81a7730a7612f1b6ac.1691575243.git.nicola.vetrini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB7592:EE_|AM7EUR03FT052:EE_|PAVPR08MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3bef2a-7f0e-43d2-a0db-08db98dd75be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ksC50CeKdPgfjcs/pXTAVW+ucQOlDLO7v6jVbngU/e404HPkCjdBXaoHX+/EKixWV0wd23RQ8BwaqYITtOPplkqE3zvE2s7uOYwQDdYRJ2c+ssgG6Hs9TIWktk1BiujWzsPob6jpA6c9NMrIpRQtXRh6+nE7KtDKAuQWTySNNOJznBjbZxvc8CTLkZSzl0isFmUOQrrCDwcoEjQ1Q+32L3vMJj6hUHuB+XjXF2x8sHHdrWCcFcWLlMNcrADs8i4WR9RwZUVE51gzWoDyPBOPyKBR0gnWiUq1z39pOBzJgR4roYlX2QqA7Cc2vzeF5SAL34yJM3iYa6Ubb4GqibwHqgFZlquz9MNInP1TnwI8gE/ZXVb8CIlBQyP3710SExkuAJ0jccXWYnKTe/EUESipQS49segaURT34NqhCvN39omuMnQi4ww5AMyjF+9oDvoEQ0NEzMSTqE+Nyn4eIBhPjgiuP9CKMWgAIq9M0AliFl5wKpHwIb0ZUOupKRAxXpOei1eaD6J0d3ynwzgIgotPQS2j9r4+k4vbzxcHjggf8tMKAKDt2XM3ldZOP8bcCe+ZHbHobV/Cs1z81kolpgtAWBj1qEmH0zVqtmEbJEC4RPVVFfaoX3hKCW3DQgkkL/6Ux4aa3ISnSMe7K7qSiLZk9Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(186006)(1800799006)(451199021)(122000001)(478600001)(2616005)(6512007)(26005)(53546011)(6506007)(8936002)(41300700001)(91956017)(76116006)(66446008)(66556008)(66476007)(66946007)(64756008)(316002)(8676002)(4744005)(4326008)(2906002)(6916009)(6486002)(71200400001)(36756003)(54906003)(38100700002)(33656002)(86362001)(38070700005)(7416002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <81BDF0E81145284F9A8CF16ECEB2CD2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7592
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a215bdea-0e15-4f8f-69f6-08db98dd65a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fCuvFc9aliqCcD8VTZLDHSL+RuPirwSgom9u8vlf8jW4DGd2X9Y5b0FR3Lj4+wXkOBxiiL0Q8OWrbfKLE75TPhgO49JFXOYo5Mnm5wYBkD9PnLyo46sr34AXGNgZN7mdGQdm02FLRBgbo4f7rZ0XoufpceMHkEouh6H4yYPpnu7iX97REXR9jkNDNpVPdlXp3h1YunS2GLx4Au1Ieh1XFgn3yMx8tMGMxM2ysxzdb0V7We4zZIai4Hym3QprzJ98WOFe5naROM/SUv5hGpElJzZe3oO5HewEvokoX7EsMUz11ifW+MwM2MjZvdTx7X62pICl1mX0gTzUfm9rT6ZTv9HZ2SAjvL1y7sJSTKt1z9EohQoj6rhrGX6GLvaoLqlUW2utUYN+zxHcIQtQpaQg1abG+/prcJ8tCYaSconEU8w9V7mkkFGvcjc4CdIvGys+Ebzw3WDjncQ6S65IiXRxLcSofxLDfyduAP0txIGn4R3oVwo1+uDuA0b2gXsxf2+fDbbKFkzwUqkqz+P04CPHiFXsCLkeWfBWOYNvuuvixA40IqmN2KNWnXgUwi6/yq5eLW3sxoepEh2YgU4vbh33L2n5cP3m/QSLN0f47KIxa/M1pZ5BXgX0FGKY1LW+wvYPbtaUnB9q7z7EJLP1von/O/urdUkrlHMei8hJOkQNwSxhP+k+vfWoN70IVLqPizG2s9wr5ZEBSHjG5dXSL0tbUjz1wgCWAdSQLaodI/bbpCFb7/J4B+kHgQoHzOVqRuVs
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(82310400008)(186006)(1800799006)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(356005)(478600001)(82740400003)(81166007)(2616005)(47076005)(336012)(40460700003)(6512007)(26005)(53546011)(6506007)(40480700001)(8936002)(41300700001)(70206006)(70586007)(316002)(8676002)(4744005)(4326008)(2906002)(6486002)(6862004)(36756003)(54906003)(33656002)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 13:35:13.3210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3bef2a-7f0e-43d2-a0db-08db98dd75be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9040

DQoNCj4gT24gOSBBdWcgMjAyMywgYXQgMTI6MDIsIE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0
cmluaUBidWdzZW5nLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgZnVuY3Rpb24gJ2lvcmVxX3NlcnZl
cl9tYXhfZnJhbWVzJyBjYW4gYmUgZGVmaW5lZCBzdGF0aWMsDQo+IGFzIGl0cyBvbmx5IHVzZXMg
YXJlIHdpdGhpbiB0aGUgc2FtZSBmaWxlLiBUaGlzIGluIHR1cm4gYXZvaWRzDQo+IHZpb2xhdGlu
ZyBSdWxlIDguNCBiZWNhdXNlIG5vIGRlY2xhcmF0aW9uIGlzIHByZXNlbnQuDQo+IA0KPiBObyBm
dW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY29sYSBWZXRyaW5pIDxu
aWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCg0KTWFrZXMgc2Vuc2UsDQoNClJldmlld2VkLWJ5
OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCk1heWJlIGl04oCZcyBh
bHNvIGJldHRlciBhZGRpbmcgdGhpczoNCkZpeGVzOiA5MjQ0NTI4OTU1ZGUgKCJ4ZW4vbWVtb3J5
OiBGaXggYWNxdWlyZV9yZXNvdXJjZSBzaXplIHNlbWFudGljc+KAnSkNCg0KSWYgdGhlIG1haW50
YWluZXJzIGFncmVlDQoNCg0K

