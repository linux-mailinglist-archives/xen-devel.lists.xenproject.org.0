Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA9F40027A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 17:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178233.324128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMBKO-0000np-Ip; Fri, 03 Sep 2021 15:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178233.324128; Fri, 03 Sep 2021 15:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMBKO-0000m2-FQ; Fri, 03 Sep 2021 15:42:04 +0000
Received: by outflank-mailman (input) for mailman id 178233;
 Fri, 03 Sep 2021 15:42:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvJD=NZ=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mMBKM-0000lw-W4
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 15:42:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13f325b0-82b0-4577-8d40-c31b587b4a9a;
 Fri, 03 Sep 2021 15:42:01 +0000 (UTC)
Received: from DB7PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:10:36::21)
 by VI1PR08MB3869.eurprd08.prod.outlook.com (2603:10a6:803:bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Fri, 3 Sep
 2021 15:41:57 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::55) by DB7PR05CA0008.outlook.office365.com
 (2603:10a6:10:36::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Fri, 3 Sep 2021 15:41:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 15:41:56 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Fri, 03 Sep 2021 15:41:56 +0000
Received: from 225ad6a0dd7c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 667FB746-F948-4870-BAF1-10147472F887.1; 
 Fri, 03 Sep 2021 15:41:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 225ad6a0dd7c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Sep 2021 15:41:49 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6799.eurprd08.prod.outlook.com (2603:10a6:102:13b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 15:41:47 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 15:41:47 +0000
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
X-Inumbo-ID: 13f325b0-82b0-4577-8d40-c31b587b4a9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/2w3w+Uf621jp6T0BcYnlrni+StxWj3wQqAu2bVjOk=;
 b=VlcFFBHWdSbfRa/jMXlr9MArzklV7JmpLw4iXSzvbjDqH9oS7CTdlOdkGmUaOkePemZVQkUKPGRlmLYt9YM0udgi4nFA7xS9YpJMHCdEIzVhg6cv2ePmgnak7f1ajA0qJhwAhODooPygtzY9S5aw2MwNHBZc0OHJEHDKNJFWQuA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 674871f30fdc51aa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAJ//xP/Ak0GYtnAYkTXpGRaapCgREl0F3WrxCOLn3K+eNgdC89Yvsy4vkmQp+TuyJQVjDdoMcynUDK0MOXpt6VcrN23EqgVULtg2ha14CJurPCvcjHzM/qR8pLsWnoSXDZdkXJHYW6C1+OVTA5NXE1qv6zwQZv6yH+GtdT+n1cRvBRYDOoMi9QdoMy2vQP9NMbeMr7tnXBxFPiD8IKyLFTM2kKY1A5aDcBef8H2Vsf83gpe61jNq+SBwY2jJghdjrg5vv8bEVd0p7ixtfkXSrJvihDRHeYX+k0xxfvlY44vYdeXNQkNbDFodgSC2AJD9WK+2zZ2foipzvvV17QJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=S/2w3w+Uf621jp6T0BcYnlrni+StxWj3wQqAu2bVjOk=;
 b=jHNuHUXlhPpY9T0jkDt2WRo1n7B1G1ZbhN6mvC1pqJELbXN5Eny8bPjr0ViAUKjwluzNYnPVgoE3rkEz2TP7DW/Yl80dci7svzxcSom/S98NRz9GRWReufPS4q3ixFLKqpEdiCSoC0dGhOd9gJ6Z9YGoZBYLgEp0v/CJyWs5vZtbMBiKvdlBx8T9kIEQrBiKh3hferlWI4B3LpDwK59qymG41bD9krrajJf21XSUqggt4v5YE/reQMJI7S9hUiAmcBdPW/GO7ew+y7kybA2vPRf2laAjgiMDK0AXzE2L2Wuu0YyOqG1EtnBgFxeS9/wxzXpdeXaHj+09FnO72OPwkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/2w3w+Uf621jp6T0BcYnlrni+StxWj3wQqAu2bVjOk=;
 b=VlcFFBHWdSbfRa/jMXlr9MArzklV7JmpLw4iXSzvbjDqH9oS7CTdlOdkGmUaOkePemZVQkUKPGRlmLYt9YM0udgi4nFA7xS9YpJMHCdEIzVhg6cv2ePmgnak7f1ajA0qJhwAhODooPygtzY9S5aw2MwNHBZc0OHJEHDKNJFWQuA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Crash when using cpupools
Thread-Topic: Crash when using cpupools
Thread-Index: AQHXoNo0buBDGTl+VEiGgPdGr1E/CQ==
Date: Fri, 3 Sep 2021 15:41:47 +0000
Message-ID: <FBF65354-8C41-41B4-8A24-BA1485CAE073@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 136f5789-ccd3-453b-df0a-08d96ef15c98
x-ms-traffictypediagnostic: PAXPR08MB6799:|VI1PR08MB3869:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3869DE9D4E2C81276D2984F69DCF9@VI1PR08MB3869.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7dym35IrXBwamjNRfh7cop5gJF4z4KZ2UiPBiWKXjnuUB3g8lI4r46eREK55+Fw3yPJ4dcLuJo9qii6X+vZ8PwmBLehYkzhZT1dOhsDGRt/9NBfgQnMOX9BgU5oElgupoLDtPfGNVQ1/LB5OsE4jQferXw99AlMZyLtdCsrPi6kTEZMXWIhrRQxb8qDIhCMWs+6guTYQirirAqejcOWw0v/cu6VYxcivJWQG8wR0Z/xSx4O/4JU0Mc5fKehgSiChtPuL1vKHDfQEwTnYDyM4QvAuk4I7uVdpw+2Iirn30QE5mPeNGsanBHQ9Q8sn5jhQ+Pm7HSA5I5NDA088PBAk2qkCiCxZ32XQJQ9RqijlcXdsN4AndDWLQ7LCgrQoQ63xU0lbJBaENYDWZVgMn5+QksND/JqkMnTzWcZ5FHkwBC+h4tCpP/2JmDLPLtlarvgU2OawlB3F6PX73CNaBuS0Kfx0jg8Uu/m/RwMtAfTTkOz+Rnd0CoHsKt72RDdV1fEnVWx7cDb3kXLe6wP8SWGLxbqeaX3hetbD2WpvQ+tuAMc0kqrFtHMXYvGy76UZIsuluHslFazMAxH/+DlVg0JcMOVjT+Y2JKuylZuWdlUGXTrPpcjIEMsyjmToohei5dMuOcfXazm5WzZHoxEkOJQ1FY6j9wAoow5XtONCHlPpt4AWiSbrvCb6y+QE0Wkm/Qm/pwndWcPr9mF9bJ+MQwmdzcPsw8xaMptZnecFjeB2lV428P/sAvF1RMMkR4QTP/Mu
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(83380400001)(2906002)(5660300002)(66476007)(66946007)(66556008)(86362001)(71200400001)(2616005)(8936002)(8676002)(54906003)(478600001)(6506007)(33656002)(38100700002)(6916009)(36756003)(122000001)(6512007)(186003)(26005)(316002)(64756008)(3480700007)(6486002)(4326008)(66446008)(91956017)(76116006)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7AC348BCC95A142BB182AA77835CC61@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6799
Original-Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f00d02b-faf6-4da4-fb27-08d96ef15704
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xr+UaOTRAtJTdVTBqZSKnBPROHXpDV7fPSIiN4n3uKEzkCclHsIbHqI6l2kddFAJEfWP0nt7jOPhycN+vcoWTuA/kTZOSEolMPMK1qbfkgJ0WDqVvrBA/YiHY6F9RdaayPY3s4MMuMD5gBlY0mQmTcOLFuMpYX41NWlJBfobapPFrBfxq5DtyMXyeoNKsCNumRY0SVjVOWdOgjQOuSQdwmbNp4SZ67N6UD7j9akq0fJTQgYlRHlYsjlGQfpb37fckwcPPgMZrnRU7D6Kxp0j4pS/pNoyGE0p5qgJXxIOU5/r127/dRlk3KGyvudC19OzYKgleTu2YdSEQ/B2Q84cti/vH9IStt3MG0hRX6A2w8IgGs1GkcVFP3jwzNwrp772v9X3jMvbi7mCbhvimXOtvnhx9TQyNa70TanJziCMlJbZ8wObpf9CrJNmY5LDa6+3LtDHM62oZGjm7ujQzDLVgg/HRB8GKy6L3fcPFlRW8nJZDqk0UQNNWZfY1sMxN9ekYd1+5k3paPaSGMlem3UsELdeHuJ34u997Qb4jVsgIz91lIEMbhJKU7T//MLjhdlk2Uy+Gev1hHPDTn+XA999Qo0LdgaIDtrdavashXb6b55gsYegmjAm0CjdqLJWKTzMdzJ9R630KQtN60oOmlDsAzR7sO1Tnlli/tyeiWb8pAEpHH8XMe3BZDe7u5buWRpy7+gF+jvDM0MvjFlEIymz9w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(107886003)(508600001)(5660300002)(356005)(26005)(4326008)(8936002)(3480700007)(6512007)(6486002)(186003)(82310400003)(70586007)(86362001)(47076005)(83380400001)(70206006)(36756003)(36860700001)(2906002)(6916009)(8676002)(6506007)(2616005)(54906003)(336012)(316002)(81166007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 15:41:56.9242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 136f5789-ccd3-453b-df0a-08d96ef15c98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3869

SGksDQoNCldoaWxlIGRvaW5nIHNvbWUgaW52ZXN0aWdhdGlvbiB3aXRoIGNwdXBvb2xzIEkgZW5j
b3VudGVyZWQgYSBjcmFzaCB3aGVuIHRyeWluZyB0byBpc29sYXRlIGEgZ3Vlc3QgdG8gaXRzIG93
biBwaHlzaWNhbCBjcHUuDQoNCkkgYW0gdXNpbmcgY3VycmVudCBzdGFnaW5nIHN0YXR1cy4NCg0K
SSBkaWQgdGhlIGZvbGxvd2luZyAob24gRlZQIHdpdGggOCBjb3Jlcyk6DQotIHN0YXJ0IGRvbTAg
d2l0aCBkb20wX21heF92Y3B1cz0xDQotIHJlbW92ZSBjb3JlIDEgZnJvbSBkb20wIGNwdXBvb2w6
IHhsIGNwdXBvb2wtY3B1LXJlbW92ZSBQb29sLTAgMQ0KLSBjcmVhdGUgYSBuZXcgcG9vbDogeGwg
Y3B1cG9vbC1jcmVhdGUgbmFtZT1cIk5ldFBvb2xc4oCdDQotIGFkZCBjb3JlIDEgdG8gdGhlIHBv
b2w6IHhsIGNwdXBvb2wtY3B1LWFkZCBOZXRQb29sIDENCi0gY3JlYXRlIGEgZ3Vlc3QgaW4gTmV0
UG9vbCB1c2luZyB0aGUgZm9sbG93aW5nIGluIHRoZSBndWVzdCBjb25maWc6IHBvb2w94oCcTmV0
UG9vbCINCg0KSSBlbmQgd2l0aCBhIGNyYXNoIHdpdGggdGhlIGZvbGxvd2luZyBjYWxsIHRyYWNl
IGR1cmluZyBndWVzdCBjcmVhdGlvbjoNCihYRU4pIFhlbiBjYWxsIHRyYWNlOg0KKFhFTikgICAg
WzwwMDAwMDAwMDAwMjM0Y2IwPl0gY3JlZGl0Mi5jI2NzY2hlZDJfYWxsb2NfdWRhdGErMHg1OC8w
eGZjIChQQykNCihYRU4pICAgIFs8MDAwMDAwMDAwMDIzNGM4MD5dIGNyZWRpdDIuYyNjc2NoZWQy
X2FsbG9jX3VkYXRhKzB4MjgvMHhmYyAoTFIpDQooWEVOKSAgICBbPDAwMDAwMDAwMDAyNDJkMzg+
XSBzY2hlZF9tb3ZlX2RvbWFpbisweDE0NC8weDZjMA0KKFhFTikgICAgWzwwMDAwMDAwMDAwMjJk
ZDE4Pl0gY3B1cG9vbC5jI2NwdXBvb2xfbW92ZV9kb21haW5fbG9ja2VkKzB4MzgvMHg3MA0KKFhF
TikgICAgWzwwMDAwMDAwMDAwMjJmYWRjPl0gY3B1cG9vbF9kb19zeXNjdGwrMHg3M2MvMHg3ODAN
CihYRU4pICAgIFs8MDAwMDAwMDAwMDIyZDhlMD5dIGRvX3N5c2N0bCsweDc4OC8weGE1OA0KKFhF
TikgICAgWzwwMDAwMDAwMDAwMjczYjY4Pl0gdHJhcHMuYyNkb190cmFwX2h5cGVyY2FsbCsweDc4
LzB4MTcwDQooWEVOKSAgICBbPDAwMDAwMDAwMDAyNzRmNzA+XSBkb190cmFwX2d1ZXN0X3N5bmMr
MHgxMzgvMHg2MTgNCihYRU4pICAgIFs8MDAwMDAwMDAwMDI2MDQ1OD5dIGVudHJ5Lm8jZ3Vlc3Rf
c3luY19zbG93cGF0aCsweGE0LzB4ZDQNCg0KQWZ0ZXIgc29tZSBkZWJ1Z2dpbmcgSSBmb3VuZCBv
dXQgdGhhdCB1bml0LT52Y3B1X2xpc3QgaXMgTlVMTCBhZnRlciB1bml0LT52Y3B1X2xpc3QgPSBk
LT52Y3B1W3VuaXQtPnVuaXRfaWRdOyB3aXRoIHVuaXRfaWQgMCBpbiBjb21tb24vc2NoZWQvY29y
ZS5jOjY4OA0KVGhpcyBtYWtlcyB0aGUgY2FsbCB0byBpc19pZGxlX3VuaXQodW5pdCkgaW4gY3Nj
aGVkMl9hbGxvY191ZGF0YSB0cmlnZ2VyIHRoZSBjcmFzaC4NCg0KQW0gSSBkb2luZyBzb21ldGhp
bmcgd3JvbmcgPw0KSXMgaXQgYSBrbm93IHByb2JsZW0gPw0KRG9lcyBhbnlib2R5IGhhdmUgYSBw
b2ludGVyIG9mIHdoZXJlIHRoZSBzb3VyY2Ugb2YgdGhlIGlzc3VlIG1pZ2h0IGJlID8NCg0KSSBo
YXZlIGEgd29ya2luZyBzZXR1cCB0byBkZWJ1ZyB0aGlzIGlmIGFueSBvdGhlciBpbmZvIGlzIHJl
cXVpcmVkIHRvIHVuZGVyc3RhbmQgdGhlIGlzc3VlLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg==

