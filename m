Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256326E2F16
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 07:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521438.810138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnY1o-0004W4-HX; Sat, 15 Apr 2023 05:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521438.810138; Sat, 15 Apr 2023 05:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnY1o-0004Sw-Ec; Sat, 15 Apr 2023 05:00:48 +0000
Received: by outflank-mailman (input) for mailman id 521438;
 Sat, 15 Apr 2023 05:00:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrIm=AG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pnY1n-0004Sl-96
 for xen-devel@lists.xenproject.org; Sat, 15 Apr 2023 05:00:47 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b0ec4dd-db4a-11ed-b21e-6b7b168915f2;
 Sat, 15 Apr 2023 07:00:46 +0200 (CEST)
Received: from AM5P194CA0012.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::22)
 by GV1PR08MB8618.eurprd08.prod.outlook.com (2603:10a6:150:82::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Sat, 15 Apr
 2023 05:00:33 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::49) by AM5P194CA0012.outlook.office365.com
 (2603:10a6:203:8f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Sat, 15 Apr 2023 05:00:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Sat, 15 Apr 2023 05:00:33 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Sat, 15 Apr 2023 05:00:32 +0000
Received: from 9506945cc5da.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 399F7453-B466-471A-A2F8-A96EABF796A7.1; 
 Sat, 15 Apr 2023 05:00:31 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9506945cc5da.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 15 Apr 2023 05:00:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7707.eurprd08.prod.outlook.com (2603:10a6:150:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 05:00:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 05:00:21 +0000
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
X-Inumbo-ID: 7b0ec4dd-db4a-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rsxox0ELCpNEOYk4he/tfF4VeGmY1BM8iiwIZeOxqKE=;
 b=IGwo/iU9dQT0eZG8M0Wz0XWoCbSKWIPx9vNPc5NSb2DMxfF+65/VMX7Cmk9srGMYtqksYRwVvdGJBwPBV1l9PnE3PY2Qa7iE0m4dvjxZ8lHTUM3sqo8p29fr8REZTC6EHxIFi0CySnKbP/mH6XOtzE107shizdKcJObOrkaC9KE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTMJFwAqGbE6eyzWDb+wr+ULXFPqc73gXwGKttLdgpdsx35shMLAAoPjB4pVAodfiibL8HF5uV3LWd88LREPZXaSFbHcdjlXeFKNIq0CpB2IB4Ie3tgQJ1IoCWcr0PcI90ERa6haQ2a7OFWDzupAvkQtDJ145zzew2tuaqQkj/8xg8ZprlSbJ5rPBF9i2+I/TPqEHG6Fqe/GJlAmFvALDR4XH6+5o8/QwR1z+uVbmdjfU5f2+DPFT9VfhZb1AhzfYApXzh2H7tsLUNqjkpuSntHd96d4988ckKU5vkVr8ALeUizhXXLxKqaOIoJ4nqA2O46KkEpDRdLOvj2OEwnn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rsxox0ELCpNEOYk4he/tfF4VeGmY1BM8iiwIZeOxqKE=;
 b=byu/r7szMOOZUXqgMnneGBUiK2vQ9aio0E7h4pB851A/kYkqSiQxoKbc7HyMyfGZ8BIgBlPTgxBUMAp+Lx63kT+BcrJ4VBiVvemFCUZsbIx1d4i9kFpNFFclcTIwTVwi7z2pWGzVaChsUL65iLUDeLsQE1H3+vQOLmOJlPXGqKjAw9QZRodckhNg4CViStfRAWo9JkFphP145NP5SL2tv+MGye5Yc+DmwU79YEYCHwaiVQZJ3vLdB/6Ysb9pJV4dBD6QTw/oEptD/Ab9BuK6FXNHo9TEBCnsBtlk7moWeOVzvV9C5HxGK7k9/bbu5XbRAyKarBOXsVQ90XAS5kC6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rsxox0ELCpNEOYk4he/tfF4VeGmY1BM8iiwIZeOxqKE=;
 b=IGwo/iU9dQT0eZG8M0Wz0XWoCbSKWIPx9vNPc5NSb2DMxfF+65/VMX7Cmk9srGMYtqksYRwVvdGJBwPBV1l9PnE3PY2Qa7iE0m4dvjxZ8lHTUM3sqo8p29fr8REZTC6EHxIFi0CySnKbP/mH6XOtzE107shizdKcJObOrkaC9KE=
From: Henry Wang <Henry.Wang@arm.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 3/3] xen/arm: fix unitialized use warning
Thread-Topic: [PATCH 3/3] xen/arm: fix unitialized use warning
Thread-Index: AQHZbwMRTii87254YUmjLql73V41Gq8rnEuA
Date: Sat, 15 Apr 2023 05:00:21 +0000
Message-ID:
 <AS8PR08MB7991CCB0440E0B7F6D074C93929E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
 <20230414185714.292881-4-stewart.hildebrand@amd.com>
In-Reply-To: <20230414185714.292881-4-stewart.hildebrand@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E52D9A63ED09EC4A94CA29B101DE4A2E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7707:EE_|AM7EUR03FT025:EE_|GV1PR08MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: d9eee0af-6d71-4e1e-45b3-08db3d6e57be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dukRCfPNJGFxQd7AgqzS3+YrgUDeaJ165m396hj4i9IRynuWbgqdpUg/PTT7SmNQzEzKbMFwCUFGawcTUxbXWnbbuKzAmdLx69lFWgH0GrtIxAYp2nD82zVAzXsLEYrWKR15euWc9V8B0D+sIYV3xMH0SjL9l0lYE3Y4i8mlWzPXOMvnJQ8RmgRqJF50NKo88QUoQiPGxXG/1Y2llvrU6T4w8i81PA36SVcATr1UxFCVmcQhoTwzOAh0PEnlydx05WS3kyP/nPtJPa0oSx962LCfOqQ5tzfXgKxp/TNtMIcGHF6q55wS8D5XkP1N+yJpIqg2YViO+cc33fpm6rf6i2sDDddfwnymG6swTkPBXDu9dhZ3uPfIPnYwPP21NwalyYdbizqrnI0j3iA1NU+hKTND+l2IO0I9IKiQI7L/AwSuNJWPSGrvRZjhSaNB+yEYXuo96Y/Mfg1vvlWd1BJDb5qJx0Lx/gC8PK4p5I6V4FOz3VsY635vXu0JIaMnHlttMHaDNIAzB71RphNB1DcQxTf83a9AVIE34Kz3UWiv1YwnR98g4xLjZsADQA35W5jQd5Xtu7WwTKHbnr2TpH/1wvrFfJb8d6gLbTgDjDmQJPNBxKzeqGUD28IV2LrqvgnU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(478600001)(110136005)(316002)(54906003)(66556008)(66476007)(66946007)(8676002)(64756008)(66446008)(76116006)(55016003)(83380400001)(33656002)(186003)(9686003)(38070700005)(2906002)(122000001)(4744005)(7696005)(4326008)(71200400001)(41300700001)(86362001)(26005)(5660300002)(8936002)(38100700002)(52536014)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7707
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a1fd1b13-0c8e-425a-59b8-08db3d6e510c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3lvOOqLEt04U9wuBqfRFmnr2ELd2g/JrNjAkkrhh1/rux/KoOlLA/Nkql2IbmBKZ74/9N1tfpGwjM8+4ThvJhYHTCKe8QgD4BoDAcoh28d3WRu/Lt6wQuLJEH1MpjtNF58WSeLrTwMhV9cKxyPGQXduA04z3KxQvvZuhkIfU73CwpRACKsgbBz/epcU3pLxOQC/AbA5rlcLG55o+ROTKsBDTu4FLOCsO4gWN0o9XsEoCbDbHE2bzKO6HTvVwHW2jBJMSTxVjbqwsvLSCISium2S8Ca20nvLxnsWHFpPJ1GqlxC2ZZpYx1JkUq8jIo/PvOlsaMYm2PKUIhpSMNsS04WvVqlIo2kUrcvjA91dnUxsTO5vKyIbGe8C/w2ru2HS/If0r/ZPowHTpouC+o2+qbV/IUXnbQPzgvZK1J6LDzJ8EQYtNvAzaiOh693lxZVyvWbbEi8fpqTH0JSwEdcYTQ/1usHFDoQ9I5Dbuc9REZuY2WNG3ADFyPcR3aCXuqf+ZeQ1gb0D2fwi5A4j8B9cJwudaww39HZO4OUSLqGYX6uzHLNI1ZkYAyF+dWradhVTWOWQ/GqOtj5h4nUJtlvwz/npqydPs+lMbH3mLmOreW7sh1S0U/H/FOzLc1Y8RjmIAKrgG8i9AfVnkMmjvfK2Um5oImL90Sk1VHVfHqnDdtoZbNPtGvYZwcch01K3vnT8wPPaujRfU3/R8cH7H1q0jQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(5660300002)(4744005)(7696005)(40460700003)(2906002)(70586007)(4326008)(70206006)(86362001)(81166007)(82310400005)(41300700001)(33656002)(478600001)(356005)(52536014)(316002)(8936002)(82740400003)(8676002)(55016003)(40480700001)(54906003)(9686003)(110136005)(6506007)(26005)(336012)(36860700001)(107886003)(186003)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2023 05:00:33.0216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eee0af-6d71-4e1e-45b3-08db3d6e57be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8618

SGkgU3Rld2FydCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBTdWJqZWN0OiBb
UEFUQ0ggMy8zXSB4ZW4vYXJtOiBmaXggdW5pdGlhbGl6ZWQgdXNlIHdhcm5pbmcNCj4gDQo+IFdo
ZW4gYnVpbGRpbmcgdGhlIGh5cGVydmlzb3Igd2l0aCAtT2csIHdlIGVuY291bnRlciB0aGUgZm9s
bG93aW5nIGVycm9yOg0KPiANCj4gYXJjaC9hcm0vZG9tYWluX2J1aWxkLmM6IEluIGZ1bmN0aW9u
IOKAmG1ha2VfY3B1c19ub2Rl4oCZOg0KPiBhcmNoL2FybS9kb21haW5fYnVpbGQuYzoyMDQwOjEy
OiBlcnJvcjog4oCYY2xvY2tfdmFsaWTigJkgbWF5IGJlIHVzZWQNCj4gdW5pbml0aWFsaXplZCBb
LVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQ0KPiAgMjA0MCB8ICAgICAgICAgaWYgKCBjbG9j
a192YWxpZCApDQo+ICAgICAgIHwgICAgICAgICAgICBeDQo+IGFyY2gvYXJtL2RvbWFpbl9idWls
ZC5jOjE5NDc6MTA6IG5vdGU6IOKAmGNsb2NrX3ZhbGlk4oCZIHdhcyBkZWNsYXJlZCBoZXJlDQo+
ICAxOTQ3IHwgICAgIGJvb2wgY2xvY2tfdmFsaWQ7DQo+ICAgICAgIHwgICAgICAgICAgXn5+fn5+
fn5+fn4NCj4gY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMNCj4gDQo+
IEZpeCBpdCBieSBpbml0aWFsaXppbmcgdGhlIHZhcmlhYmxlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRz
LA0KSGVucnkNCg==

