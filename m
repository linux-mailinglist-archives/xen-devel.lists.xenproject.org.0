Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5247A803166
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 12:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646841.1009434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA70B-0000vh-TG; Mon, 04 Dec 2023 11:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646841.1009434; Mon, 04 Dec 2023 11:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA70B-0000su-QF; Mon, 04 Dec 2023 11:20:39 +0000
Received: by outflank-mailman (input) for mailman id 646841;
 Mon, 04 Dec 2023 11:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fUg+=HP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rA70A-0000sn-NB
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 11:20:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25da2553-9297-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 12:20:37 +0100 (CET)
Received: from AS9PR06CA0178.eurprd06.prod.outlook.com (2603:10a6:20b:45c::10)
 by PAVPR08MB9459.eurprd08.prod.outlook.com (2603:10a6:102:317::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 11:20:34 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:45c:cafe::ac) by AS9PR06CA0178.outlook.office365.com
 (2603:10a6:20b:45c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 11:20:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 11:20:33 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Mon, 04 Dec 2023 11:20:33 +0000
Received: from 8c26ec8235c4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B4328F5B-8DFB-40DC-AB20-9B72A90FCC57.1; 
 Mon, 04 Dec 2023 11:20:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c26ec8235c4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Dec 2023 11:20:27 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB6029.eurprd08.prod.outlook.com (2603:10a6:102:e7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 11:20:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 11:20:25 +0000
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
X-Inumbo-ID: 25da2553-9297-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TH8uC9U1it20MKjoKHHvYi9QAHSoG9ElgJ3X3QlS7mm1bgOMeq4XGL8XwiUHV+8+RoefvqlXTAkMRVXs2L1xog3R/GUvJgFh/Qy3WQOX7w0lBRMcWLjkssh/2RCatE6rFTswnlOhpkZi9J7Hnd3A3Uf5zYui5fGom2vuzgz8XsAzeuX9iYqqT6JKRNymF4meAhsIrYc7nGCEwDbgdGzWTyneuYL7V6jm/qbgxtRUalJeocEhDvX+jQMp6DypKZSFrsOa6PJT3Eoxdua51EMYpJNk/44mpa+1/8gRJ0pWMYEGcnojXX1tNXcX+iXmMddGFvxndvQ/7923LenGPNcVeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKAh+CP7L8sUUdKiWQXAI/d+t9xt+4qqGVTXhh0l9Gs=;
 b=iY/Sh58puz+Eb9H3W1NGvGoGfgDuEBCGlEWmYEnMLGJmzgzvtPeDi43qdw+ObkK/U5gOcbldutkjdaVmkMTpNdHkRRE4Hn+Kyv9sP8NvDPMXDLpQC7XzR6/S29G6MEnY/Ayorb2IaALaqVYT3tcL4uDrC1KnAiisvp/Y2E/d4HHj3B8f+l1uSFpJL/g+8TuC1r0Ji/p+JzBPl1ByqDfnw/GBn8gVQiNfUd2FI6m/L1Abi7ySSqpD4seQMqfyeRVrjeLn5KkUqa1rFLC0GyctpLsmPaRcLfJ2mud3vr7eEXkZc5K9GSUjC5AFOyjWxNOFI0mHbTIZRrw5+cZsZOdvTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKAh+CP7L8sUUdKiWQXAI/d+t9xt+4qqGVTXhh0l9Gs=;
 b=pH6UsJ5DIg7zPEcEk6rWrknUlqQFXVlI2w6jkOnhat+IbqgeS6zssVctitvohrQH2kY1z97bgENr24Z8NvannrmKWnr9r7MBtaTjzcMKIJIp/dC2HnIjw+ew2j1uiI9pB4BROcgCGAfbTuAiviqG02ctcccRGkseyeEEmepwZBk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0bc67a411945334
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=db7YEtXb7y7MClJtxHG9rhwGWkXxlyvwaizwioe1L0D0VnBV73fcALicH7H8bE/BzdU9fkUmrT3GE8giSMq5+U4F1E61IYUIYgb2Ap3iKHg1oB1+INnpD7kzhXvF15T0ajDoTIv1D/hLpQeHQKGuLIpxJBrmknYXAVmqt8ahC7jVjRH5q4SUQwfd4gdJlJJx24JurRKwBSFE8Aq2j5mW0uSdGZ4cQaU+cjUh9p1E++k5bqEU/DHt4VIgM5IQ5yoYXb1wz81DgyhCv0HP61GLcRulrhOfasQdlIeRWxafuMFhOzKCke3phvNdJ6iKF6GR4NC5OQPPIxzIJjHI1/814w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKAh+CP7L8sUUdKiWQXAI/d+t9xt+4qqGVTXhh0l9Gs=;
 b=Qtu/93Fwv4U6UwD4yFID7b+aUz/7LTMf6YN1iH7J56kQgCaLXxvfdy1cIW0xJw0Igxht1USMeY0UcPmxjhAjktPGNZgtlXqfIzyv0oLokLMJEDGHxrek947FOCHvv4d2zGJ73HwCXIo12nhDhavCQSOWEab9yjLL+nAbBWbW9BwANAKLHq/K/yLn7I2Sex1pBqjDPsSS2cF93axD2ou7nNZvfsC0XvCm1I1nh0tGM8B4k5Q9y6hHejfEHJ6yuVhLdlYPXavyBeyq2BNqezEmsVnxfyo72lflhOychq7mNUGKLTzKrH2X2qPwefZAfXv77f6hUryjgg0RnFbDL90XXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKAh+CP7L8sUUdKiWQXAI/d+t9xt+4qqGVTXhh0l9Gs=;
 b=pH6UsJ5DIg7zPEcEk6rWrknUlqQFXVlI2w6jkOnhat+IbqgeS6zssVctitvohrQH2kY1z97bgENr24Z8NvannrmKWnr9r7MBtaTjzcMKIJIp/dC2HnIjw+ew2j1uiI9pB4BROcgCGAfbTuAiviqG02ctcccRGkseyeEEmepwZBk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
Thread-Topic: [PATCH] CODING_STYLE: Add a section of the naming convention
Thread-Index: AQHaJIbmwHP4nuD1ZUiv2fi04v+voLCUxT2AgAQ5aoA=
Date: Mon, 4 Dec 2023 11:20:25 +0000
Message-ID: <956BC72E-0898-490F-9881-226EE7224F94@arm.com>
References: <20231201184728.31766-1-julien@xen.org>
 <0e20592b-9800-4b9d-9f2f-a996f9ac00bd@xen.org>
In-Reply-To: <0e20592b-9800-4b9d-9f2f-a996f9ac00bd@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB6029:EE_|AMS0EPF000001B1:EE_|PAVPR08MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: b69144c7-4a63-41d9-11d0-08dbf4bb085b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IDVvXYsuW5XbhFgOov6LZA9rGrGz0ftWvMoHm/8tPGGg/GDEzLspxIQwM6bDOGEvMDLeLbpL6n1COC/OK4vKVwiCl6MH9jTmwbU0sewdWJPJXIQrHe2g8nkynFxVJZU7vYrRIH+mwiM9858YP4MUaOUVBmVVmARbrvJOmFWNf7zI1tUinE+oUNUQMY0C85YjKgn5CGYu95eE5mE9SVuLIba7Xp8UxUvy+k5QKdI4X6ad6FPIF1u0WNxTBSvKKI67u65vnvLGM/EPix+Cb7MWzK8tRUz+pw3TKQswU09cVR9EvzpnZKsr3CQNeaHJYBTE3i0qgKhCJZ6LW8mCxAhBXp7HYeHfVBeAuwZS2AGAaVqMrYgpmATJ3NvjPP48GEEf2sOV83YtBUQ6OfYPtdbKJIz5jTD2MtLu8bB3ehdCGj7ALI3DtGrI0gv3EGehJ7rCl1fGGbKIi8z4JuqTV2L8QukSt7M3JVesuIeS6IWsiqASiSXqlbL/jQIiamA/VHcdV0A517MtS7TQqkDGuS6XiWVQd9Cd4z1WkPhDE51xtYLKjSvbXoxwjA+dTZnGlIcKiYo/TO4Sd2yt9sEl8/AUQojwQlgdkEmrAAyL9Ub0GtC9B8Eyo8/j04Jnk7luamC1fupsiB4cz4qZ0aGczp1g2A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(376002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6486002)(36756003)(6512007)(53546011)(6506007)(26005)(2616005)(33656002)(38070700009)(41300700001)(38100700002)(86362001)(122000001)(71200400001)(478600001)(2906002)(91956017)(316002)(66946007)(76116006)(54906003)(66446008)(6916009)(66476007)(66556008)(64756008)(8676002)(4326008)(8936002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3310F274F19B534DBE287D4B078F769E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6029
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	28929a04-bff3-410f-99af-08dbf4bb0362
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7QKL/aE4MxVrDerBdF4YvGBZUjk65O6i7GGzuj6YNtnM7G3akGTLIfWWz9daZLSywMarjpLhwYAYfqm5RKDG9SsIH3dA/7Voc6f07OYw23wZcaF8I0xeZy0p6fE+0I8O/cNvO/c8nxlx5OoaMx4RrjgBTvNkaLsQT3zO9SIMEsXeUuDviufH60KNjsGjXRWxFg1zoyKhAlFj5F9Y5/YeQ5OLBb/ctcrHffzleBdr8TaUPDNkemfD4hT90/T7tfvZiOJsD0Bnj+vE0l9QiKWfrHzBFVRwg1CzjURhHGwUjXX/joMWlnOUBBfMr6ag6srC6jm0epZHvu0g8DZlPXfjxIRquB6T9TGFXPUJcrEazgU8Bygb0oaZjyIzlGZHbsAj/UVRbpGj2ub5pCquVHnJQEyGmL2Dv2rJZpScZAHbBESPTLLv3gS3L4IYGtqMdoOUQtSu3NUehXGuFiOvZ/KVw/gvMKz/FNdpCzDCxK2b2qjvJRb9nIlLdcIKfIQkedv3+7YiRLv7nNiYVtqqnyAdtMP3VQoH1FtC8m6cEt/iK7uMWUiV04Pm/YuURNoTPc7FmDHDHtygsh7d1Is981YmZur+wGcTSxFdObMdqHN+m75cQc/BSAjaJE1oCdaO7oIZu3tOfoemTK9yhSkVQy014P9OJRLKMQqq94RCT4bWqvYztWCZ49+NLJCmbXaX+ckyUxaAAnrvknnA/I5iPm5fDcFUKhzOO01lA7zIwLXU3z3DCcSbVvgR61/wGlf7uREs
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(36840700001)(40470700004)(46966006)(5660300002)(40460700003)(86362001)(4326008)(6862004)(8676002)(8936002)(2906002)(41300700001)(33656002)(36756003)(2616005)(40480700001)(356005)(6512007)(6506007)(81166007)(53546011)(82740400003)(6486002)(478600001)(26005)(336012)(47076005)(36860700001)(316002)(54906003)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 11:20:33.8679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b69144c7-4a63-41d9-11d0-08dbf4bb085b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9459

DQoNCj4gT24gMSBEZWMgMjAyMywgYXQgMTg6NDksIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwMS8xMi8yMDIzIDE4OjQ3LCBKdWxpZW4gR3Jh
bGwgd3JvdGU6DQo+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPj4g
U2V2ZXJhbCBtYWludGFpbmVycyBoYXZlIGV4cHJlc3NlZCBhIHN0cm9uZ2VyIHByZWZlcmVuY2UN
Cj4+IHRvIHVzZSAnLScgd2hlbiBpbiBmaWxlbmFtZSBhbmQgb3B0aW9uIHRoYXQgY29udGFpbnMg
bXVsdGlwbGUNCj4+IHdvcmRzLg0KPj4gU28gZG9jdW1lbnQgaXQgaW4gQ09ESU5HX1NUWUxFLg0K
Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+IC0t
LQ0KPj4gIENPRElOR19TVFlMRSB8IDkgKysrKysrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKQ0KPj4gZGlmZiAtLWdpdCBhL0NPRElOR19TVFlMRSBiL0NPRElOR19TVFlM
RQ0KPj4gaW5kZXggY2VkM2FkZTVhNmZiLi5hZmQwOTE3Nzc0NWIgMTAwNjQ0DQo+PiAtLS0gYS9D
T0RJTkdfU1RZTEUNCj4+ICsrKyBiL0NPRElOR19TVFlMRQ0KPj4gQEAgLTE0NCw2ICsxNDQsMTUg
QEAgc2VwYXJhdGUgbGluZXMgYW5kIGVhY2ggbGluZSBzaG91bGQgYmVnaW4gd2l0aCBhIGxlYWRp
bmcgJyonLg0KPj4gICAqIE5vdGUgYmVnaW5uaW5nIGFuZCBlbmQgbWFya2VycyBvbiBzZXBhcmF0
ZSBsaW5lcyBhbmQgbGVhZGluZyAnKicuDQo+PiAgICovDQo+PiAgK05hbWluZyBjb252ZW50aW9u
DQo+PiArLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICsNCj4+ICtXaGVuIGNvbW1hbmQgbGluZSBvcHRp
b24gb3IgZmlsZW5hbWUgY29udGFpbiBtdWx0aXBsZSB3b3JkcywgYSAnLScNCj4+ICtzaG91bGQg
YmUgdG8gc2VwYXJhdGUgdGhlbS4gRS5nLiAndGltZXItd29ya3MnLg0KPj4gKw0KPj4gK05vdGUg
dGhhdCBzb21lIG9mIHRoZSBvcHRpb24gYW5kIGZpbGVuYW1lIGFyZSB1c2luZyAnXycuIFRoaXMg
aXMgbm93DQo+PiArZGVwcmVjYXRlZC4NCj4gDQo+IFVyZ2gsIEkgc2VudCB0aGUgd3JvbmcgZHJh
ZnQgOiguIFRoaXMgaXMgdGhlIHdvcmRpbmcgSSB3YW50ZWQgdG8gcHJvcG9zZToNCj4gDQo+ICtO
YW1pbmcgY29udmVudGlvbg0KPiArLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiArJy0nIHNob3Vs
ZCBiZSB1c2VkIHRvIHNlcGFyYXRlIHdvcmRzIGluIGNvbW1hbmRsaW5lIG9wdGlvbnMgYW5kIGZp
bGVuYW1lcy4NCj4gK0UuZy4gdGltZXItd29ya3MuDQo+ICsNCj4gK05vdGUgdGhhdCBzb21lIG9m
IHRoZSBvcHRpb25zIGFuZCBmaWxlbmFtZXMgYXJlIHVzaW5nICdfJy4gVGhpcyBpcyBub3cNCj4g
K2RlcHJlY2F0ZWQuDQo+ICsNCj4gDQoNCkhpIEp1bGllbiwNCg0KQ2FuIHdlIG1ha2UgYW4gZXhj
ZXB0aW9uIGZvciBweXRob24gZmlsZXMgdGhhdCBhcmUgbWVhbnQgdG8gYmUgdXNlZCBhcyBtb2R1
bGU/DQpCZWNhdXNlIG1vZHVsZXMgY29udGFpbmluZyDigJgt4oCYIGNhbm5vdCBiZSBpbXBvcnRl
ZCB1c2luZyDigJhpbXBvcnTigJkga2V5d29yZCBhbmQNCm5lZWRzIGFub3RoZXIgd2F5IHRvIGRv
IHRoZW0gd2hpY2ggaXMgbm90IGNvbnZlbnRpb25hbA0KDQpDaGVlcnMsDQpMdWNhDQoNCg0KPiBD
aGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQo+IA0KDQo=

