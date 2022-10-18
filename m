Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0A602A8E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 13:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424953.672672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okl8s-0001PD-7f; Tue, 18 Oct 2022 11:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424953.672672; Tue, 18 Oct 2022 11:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okl8s-0001Ma-30; Tue, 18 Oct 2022 11:52:18 +0000
Received: by outflank-mailman (input) for mailman id 424953;
 Tue, 18 Oct 2022 11:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RnJu=2T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1okl8q-0001MJ-Fu
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 11:52:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2054.outbound.protection.outlook.com [40.107.105.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f24fc54-4edb-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 13:52:15 +0200 (CEST)
Received: from AM7PR02CA0012.eurprd02.prod.outlook.com (2603:10a6:20b:100::22)
 by AS8PR08MB8659.eurprd08.prod.outlook.com (2603:10a6:20b:563::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 11:52:13 +0000
Received: from AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::60) by AM7PR02CA0012.outlook.office365.com
 (2603:10a6:20b:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17 via Frontend
 Transport; Tue, 18 Oct 2022 11:52:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT011.mail.protection.outlook.com (100.127.140.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 11:52:13 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Tue, 18 Oct 2022 11:52:13 +0000
Received: from 1f90a26ddfc1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4633CA88-8BCD-4FF6-989D-77A0C6EC6522.1; 
 Tue, 18 Oct 2022 11:52:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f90a26ddfc1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Oct 2022 11:52:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9966.eurprd08.prod.outlook.com (2603:10a6:102:35e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Tue, 18 Oct
 2022 11:52:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 11:52:03 +0000
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
X-Inumbo-ID: 4f24fc54-4edb-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LiiMFszQjL0A/X4bVjNLIZx2fPIpPjySLre0OIWsYFqcnoKl+zJdXT2cbPDGUQMR4pS+c3QPY7UOE2dZXoED798WyhYt6TFFVu7WQWkSxpAUCwQCpJ8/1OkSHstJXBBY8y/uR3PlgGprLMafqJgp+08EbN9FFYYIoI+Re7swxS/UNfgQpgzTRfuKAYQpj7FUXSk4Jg1iS41Ti3740DkiaGIx0D8uHjRidIiEwYf9ha0M7QuwdXGzCgzq38EmySSIkijHNjFqrjX/watOxupPioXYaJ7JYIQ5J70KSw2AIJWg6+bUaW/cM/v7GXb+0nKIILnR1obV+g7YO3YtBnhtMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsfXy0BKQDopchh9sqTepaGzECim6z7Urd9YPkG1nM4=;
 b=JBi6cjdMgYcbZ86pUQMhzwraU2TtO9aGzFDGBUqcjI/fbSB4JYbYe446SkCBimLLsJc0ungxW2OVQdcSXVwxwTT0/obwrlA8lC62dk2qWBvr84eGhQvnokccMyE0A+IvvW3QDuKU1w0jBQi+W/uoexZFjNIevCqC57xwSOfkt0V3EDfCtkx/aDtcqUvN4XSXzXyialxeEW02PmLNgbqqz+eWzMMwdWiKujEULw7r0h4S/y2LhZ81jmgU4gUBn+iqZW3xhEYA1c/nQrSC8lDHncUjOJpJAEM1qQTN5wi6GwffjsAH7CMiMVX6s4AsqwKCeA6b/NMqlgihj7qmxcNdyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsfXy0BKQDopchh9sqTepaGzECim6z7Urd9YPkG1nM4=;
 b=2Dp1n6+ptEdbzoJH+2ugOhMqRaKPq1L/3J2Z3cJBT9bb36r1slbHIhQg8WuQMjRpCK1N/tX6hh1ePT1/p2MOg/HY83mTff701iHqcfYH/V1mqZohqaRHCb1pJgnOgEQ8ypa/cgsPTiaK6hP0Z5fw3rHviQ103sKaod+w4M6tnS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7d54cf6462deb50
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDlJHqKcM1x0/RGowbmw/I3bKzQ4jBGpRGfFYxSEYrby1yYvPiMMOgcRWkFdCADtfEA8Mw0vPqfkw0uOn2RVGma3RLVBl/nuKFUfyuJnvmmCkRLcuWTWE2+WTxiwmDjkuuseqh/cSXYouguoSM5PrvTq6LZgTve1pY7plBgrDZCK1lEcyR3Nd2A8avUbU/4Hkun05YazOGHOQ8reWA/OFTVhQ4mtLyWL9WTrvjBQgANDOjWXEO4i7DdzB6AmmAHAy7GgOe0P2TPNWN5vp1BXA6hjKKaJul0JzVG9WKKqsBsDwpCo/HFSPADWQD34CF15yZDhhWrHux/Wj6sr3T363A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsfXy0BKQDopchh9sqTepaGzECim6z7Urd9YPkG1nM4=;
 b=IXH3ZNkz3DUKnvMo7UGeB0I/3slMsBMWLplJh3w3H9Yy7qbx9SEqGcNtFmRTmLUtz4uJKZwVm2dyGZ90Xbhv/WDA3ktiXs1Vvt8kbGirZe5oRHZKFDvt7WIMnW1rM3oRJ9aN3sVIx8OfSYoF76DvgOVvQ6e2n1iDOXc880NmV/U2493PbO2RMAIdVH60OptW9hlZnulyIHsmWuEeZGOzwkeaOuNY97pOUXDhZv0t+uEU8xrFvOpIze5TtBJhxRM7ckrudWISoGYPDnhtxDy1oEUkxhX1IbMw/FK3twD0kzAYMd98VYXK88xh1eHvLWIQiD24wPdSYd2gW30Gcb9VNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsfXy0BKQDopchh9sqTepaGzECim6z7Urd9YPkG1nM4=;
 b=2Dp1n6+ptEdbzoJH+2ugOhMqRaKPq1L/3J2Z3cJBT9bb36r1slbHIhQg8WuQMjRpCK1N/tX6hh1ePT1/p2MOg/HY83mTff701iHqcfYH/V1mqZohqaRHCb1pJgnOgEQ8ypa/cgsPTiaK6hP0Z5fw3rHviQ103sKaod+w4M6tnS4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 1/2] arm/p2m: Rework p2m_init()
Thread-Topic: [PATCH 1/2] arm/p2m: Rework p2m_init()
Thread-Index: AQHY4lx8NcMOBRjDdEuRGdu/FdZOvq4UC1kA
Date: Tue, 18 Oct 2022 11:52:03 +0000
Message-ID: <C324FE00-226A-458B-82BD-485313414F0B@arm.com>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
 <20221017191237.11079-2-andrew.cooper3@citrix.com>
In-Reply-To: <20221017191237.11079-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB9966:EE_|AM7EUR03FT011:EE_|AS8PR08MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 553d66bf-2c71-4ed4-1aa8-08dab0ff324e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kk6/UkN2RRGE7I7v1DdpfE+7CxyEJ2fp+lOrk5p1C403urum3/Re+bryggZQJM5urcUUXt39iO+YgrX/H3HqYK3HDsuPj67gHr9JLFPjFfyOMHUpl0xGIgBIf9DkyZGxeXWkLAKGiHtnz+Oet+X2GVjSq1GBvHpgfZHbSYhlTIuSY2P4bSwRnWnjFl9LaKGAeKjTjAusqsy5YoXftO6AUD6UhQIwpQh2bQOzPPmfCAL5VO9Vy4R6vVjzZV+J5glm/krG8p8+H3LRzrCK61VaQifjc3dUAKwrqnMxzv9zau6BtyZgLj34f0+9HkmYrXpDI0DO+sTyw/9fKZSbfHiPSBQpSUpmRVyrLDMZYVIAsJ6mvQeeCAknuF7C0OSZnGQvKN+JlFGRNvkE9EtZgtKvouZ4Iag71oFg4fJuu3wBAIw/bztZxVtsLF96UX214JHSJBN6koF47ybZqzoGW7bhTnY22T/I13DTRBOFbSgdbcDLLjJh/rxsyqhl+m0ZPyC1EZGZcvNxq4SkLGXhmgcPKwXTDez6eV9P6tRXxRc7wyhf8484hpp363c+O6bY+Mjm73vm/t19xLVae3Gwm2qgGjiB5/t1gT7+auXTNIV+81tfe57btlKND+kPhfPggX2bsUHk+X8g/6qyFpUjsveR4J2As6i36a8+k5acTb+ZTaxTYbNgTGOPFRXJgcTEVT6Qum7//OQbHyHbfNQSI+5tmPlZl5gHiHnvUlH5H47a1JOnWdI/qMEPRdC59gzsJZY4igtNbIgIJqYagmN8ZQsYqFCo4KSbqua6FlJtH1EEa2E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199015)(76116006)(186003)(2616005)(38070700005)(83380400001)(86362001)(5660300002)(38100700002)(122000001)(2906002)(54906003)(64756008)(4326008)(41300700001)(8676002)(478600001)(6512007)(26005)(6506007)(316002)(53546011)(66446008)(6916009)(66476007)(66556008)(91956017)(66946007)(8936002)(6486002)(36756003)(71200400001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2E8B52F9ED8194495832549F2F5C6C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9966
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c36276e-e939-4a5d-cc0c-08dab0ff2c6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xwQUpn698UdL/2mtnfDB3j2IpU+tlYqO2KuQD4dWzYHaJTeK/fQXGGH1c1TieqBH75Tnwb6IY8nPfXgMKdypxIxe8xJWxk7EmWjAYCu2ZnZSODm78JJSJua8AAyjD9KKjPBUK7MECC1VPdXoc+DHZjC3/LyE2zw2JiqtKvd3QZXOPsWCHoOItF8Nm7z4zwCvk8EziPji88ymHsHGbYOkK7Do3SP8dvsMsvNHqSX2lVsnwh3WbsfjZw3AD+Yaecx8HtAOREkDDU0GFN6qBxBUgzZG11bIVdgtvzBbszLjeMeYYdCqXxKkE+yrIe/H+L0QqoBIver14/8KWfMVcqlF84PhpX30WD8h5tEtbk2tu6gAvWTYVk2ndnBu4yv9MIBpJg70Npl8Py0I4Hi8f/gZgtgZXBGijYDzUA+X/JZlUHJJozEPFqCXy5eaBsfDvApapoXMev2wTFVavJgBQ94go6ho8JF6pfpXjbQ8QJgGYrUlB/w0NhDU1Nzziaph4Cy/vXE7puytEfarXHpwXjTLbDFm8O34wTp5WVGcBySDavoNlghFzbWiYvb4J+tB5BeaHoWOc29xj9PnAkZwApu+q6kFH8zr1CqRHjxQshj10GoAywj+M+T9G3W+uVnmXfopnVs9v2u7XMI91o/JAfSCjgh/arZUyCPgggcLIXSb70QU9kChk9w/8vxJ0/azc13+3OVtCDjcUNx9BSsSIRL7BxuExEZFeY4P3N5cAOhfUB0B7rmDNjsmCUOgdSHIzs/LxWLMWzp/6ns5sv5pV9Zseg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(33656002)(82310400005)(36860700001)(86362001)(82740400003)(5660300002)(54906003)(2906002)(2616005)(186003)(336012)(83380400001)(47076005)(356005)(81166007)(6506007)(53546011)(316002)(6512007)(6486002)(70586007)(70206006)(478600001)(40480700001)(6862004)(4326008)(8936002)(41300700001)(26005)(40460700003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 11:52:13.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 553d66bf-2c71-4ed4-1aa8-08dab0ff324e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8659

SGkgQW5kcmV3LA0KDQo+IE9uIDE3IE9jdCAyMDIyLCBhdCAyMDoxMiwgQW5kcmV3IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBwMm1faW5pdCgpIGlzIG1v
c3RseSB0cml2aWFsIGluaXRpYWxpc2F0aW9uLCBidXQgaGFzIHR3byBmYWlsYWJsZSBvcGVyYXRp
b25zDQoNCk1heWJlIHNheSDigJx0d28gb3BlcmF0aW9ucyB0aGF0IGNhbiBmYWls4oCdIGFzIHRo
ZSBmYWlsYWJsZSBkb2VzIHNlZW0gZnVsbHkgcmlnaHQgOi0pDQpCdXQgSSBhbSBub3QgYSBuYXRp
dmUgc3BlYWtlciBzbyBJIHdpbGwgbGV0IHRoYXQgdG8geW91Lg0KDQo+IHdoaWNoIGFyZSBvbiBl
aXRoZXIgc2lkZSBvZiB0aGUgYmFja3BvaW50ZXIgdHJpZ2dlciBmb3IgdGVhcmRvd24gdG8gdGFr
ZQ0KPiBhY3Rpb25zLg0KPiANCj4gcDJtX2ZyZWVfdm1pZCgpIGlzIGlkZW1wb3RlbnQgd2l0aCBh
IGZhaWxlZCBwMm1fYWxsb2Nfdm1pZCgpLCBzbyByZWFycmFuZ2UNCj4gcDJtX2luaXQoKSB0byBw
ZXJmb3JtIGFsbCB0cml2aWFsIHNldHVwLCB0aGVuIHNldCB0aGUgYmFja3BvaW50ZXIsIHRoZW4N
Cj4gcGVyZm9ybSBhbGwgZmFpbGFibGUgc2V0dXAuDQo+IA0KPiBUaGlzIHdpbGwgc2ltcGxpZnkg
YSBmdXR1cmUgYnVnZml4IHdoaWNoIG5lZWRzIHRvIGFkZCBhIHRoaXJkIGZhaWxhYmlsZQ0KPiBv
cGVyYXRpb24uDQo+IA0KPiBObyBwcmFjdGljYWwgY2hhbmdlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NClJldmlld2VkLWJ5
OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQoNCkNoZWVycw0K
QmVydHJhbmQNCg0KPiAtLS0NCj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4NCj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IENDOiBW
b2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IENDOiBCZXJ0
cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+IENDOiBIZW5yeSBXYW5n
IDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vcDJtLmMgfCAyNCAr
KysrKysrKysrKystLS0tLS0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0u
YyBiL3hlbi9hcmNoL2FybS9wMm0uYw0KPiBpbmRleCBmMTc1MDBkZGYzYTMuLjY4MjZmNjMxNTA4
MCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jDQo+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9wMm0uYw0KPiBAQCAtMTc1NCw3ICsxNzU0LDcgQEAgdm9pZCBwMm1fZmluYWxfdGVhcmRvd24o
c3RydWN0IGRvbWFpbiAqZCkNCj4gaW50IHAybV9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+IHsN
Cj4gICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7DQo+IC0g
ICAgaW50IHJjID0gMDsNCj4gKyAgICBpbnQgcmM7DQo+ICAgICB1bnNpZ25lZCBpbnQgY3B1Ow0K
PiANCj4gICAgIHJ3bG9ja19pbml0KCZwMm0tPmxvY2spOw0KPiBAQCAtMTc2MywxMSArMTc2Myw2
IEBAIGludCBwMm1faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAgSU5JVF9QQUdFX0xJU1Rf
SEVBRCgmZC0+YXJjaC5wYWdpbmcucDJtX2ZyZWVsaXN0KTsNCj4gDQo+ICAgICBwMm0tPnZtaWQg
PSBJTlZBTElEX1ZNSUQ7DQo+IC0NCj4gLSAgICByYyA9IHAybV9hbGxvY192bWlkKGQpOw0KPiAt
ICAgIGlmICggcmMgIT0gMCApDQo+IC0gICAgICAgIHJldHVybiByYzsNCj4gLQ0KPiAgICAgcDJt
LT5tYXhfbWFwcGVkX2dmbiA9IF9nZm4oMCk7DQo+ICAgICBwMm0tPmxvd2VzdF9tYXBwZWRfZ2Zu
ID0gX2dmbihVTE9OR19NQVgpOw0KPiANCj4gQEAgLTE3ODMsOCArMTc3OCw2IEBAIGludCBwMm1f
aW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAgcDJtLT5jbGVhbl9wdGUgPSBpc19pb21tdV9l
bmFibGVkKGQpICYmDQo+ICAgICAgICAgIWlvbW11X2hhc19mZWF0dXJlKGQsIElPTU1VX0ZFQVRf
Q09IRVJFTlRfV0FMSyk7DQo+IA0KPiAtICAgIHJjID0gcDJtX2FsbG9jX3RhYmxlKGQpOw0KPiAt
DQo+ICAgICAvKg0KPiAgICAgICogTWFrZSBzdXJlIHRoYXQgdGhlIHR5cGUgY2hvc2VuIHRvIGlz
IGFibGUgdG8gc3RvcmUgdGhlIGFuIHZDUFUgSUQNCj4gICAgICAqIGJldHdlZW4gMCBhbmQgdGhl
IG1heGltdW0gb2YgdmlydHVhbCBDUFVTIHN1cHBvcnRlZCBhcyBsb25nIGFzDQo+IEBAIC0xNzk3
LDEzICsxNzkwLDIwIEBAIGludCBwMm1faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAgICAg
cDJtLT5sYXN0X3ZjcHVfcmFuW2NwdV0gPSBJTlZBTElEX1ZDUFVfSUQ7DQo+IA0KPiAgICAgLyoN
Cj4gLSAgICAgKiBCZXNpZGVzIGdldHRpbmcgYSBkb21haW4gd2hlbiB3ZSBvbmx5IGhhdmUgdGhl
IHAybSBpbiBoYW5kLA0KPiAtICAgICAqIHRoZSBiYWNrIHBvaW50ZXIgdG8gZG9tYWluIGlzIGFs
c28gdXNlZCBpbiBwMm1fdGVhcmRvd24oKQ0KPiAtICAgICAqIGFzIGFuIGVuZC1vZi1pbml0aWFs
aXphdGlvbiBpbmRpY2F0b3IuDQo+ICsgICAgICogIlRyaXZpYWwiIGluaXRpYWxpc2F0aW9uIGlz
IG5vdyBjb21wbGV0ZS4gIFNldCB0aGUgYmFja3BvaW50ZXIgc28NCj4gKyAgICAgKiBwMm1fdGVh
cmRvd24oKSBhbmQgZnJpZW5kcyBrbm93IHRvIGRvIHNvbWV0aGluZy4NCj4gICAgICAqLw0KPiAg
ICAgcDJtLT5kb21haW4gPSBkOw0KPiANCj4gLSAgICByZXR1cm4gcmM7DQo+ICsgICAgcmMgPSBw
Mm1fYWxsb2Nfdm1pZChkKTsNCj4gKyAgICBpZiAoIHJjICkNCj4gKyAgICAgICAgcmV0dXJuIHJj
Ow0KPiArDQo+ICsgICAgcmMgPSBwMm1fYWxsb2NfdGFibGUoZCk7DQo+ICsgICAgaWYgKCByYyAp
DQo+ICsgICAgICAgIHJldHVybiByYzsNCj4gKw0KPiArICAgIHJldHVybiAwOw0KPiB9DQo+IA0K
PiAvKg0KPiAtLSANCj4gMi4xMS4wDQo+IA0KDQo=

