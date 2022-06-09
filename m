Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38CC5441DE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 05:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344538.570080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz8mD-000563-2C; Thu, 09 Jun 2022 03:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344538.570080; Thu, 09 Jun 2022 03:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz8mC-00053l-VM; Thu, 09 Jun 2022 03:24:04 +0000
Received: by outflank-mailman (input) for mailman id 344538;
 Thu, 09 Jun 2022 03:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jl5s=WQ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nz8mB-00053e-Bn
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 03:24:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aa77218-e7a3-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 05:24:00 +0200 (CEST)
Received: from DU2PR04CA0265.eurprd04.prod.outlook.com (2603:10a6:10:28e::30)
 by VI1PR08MB3568.eurprd08.prod.outlook.com (2603:10a6:803:7f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 03:23:55 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::40) by DU2PR04CA0265.outlook.office365.com
 (2603:10a6:10:28e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Thu, 9 Jun 2022 03:23:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 03:23:54 +0000
Received: ("Tessian outbound ff2e13d26e0f:v120");
 Thu, 09 Jun 2022 03:23:54 +0000
Received: from 14fc1bb5f678.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 249C0593-EB57-4EE9-A209-DA65BC9E7D98.1; 
 Thu, 09 Jun 2022 03:23:43 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14fc1bb5f678.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Jun 2022 03:23:43 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM6PR08MB5015.eurprd08.prod.outlook.com (2603:10a6:20b:e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 03:23:40 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%7]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 03:23:40 +0000
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
X-Inumbo-ID: 9aa77218-e7a3-11ec-b605-df0040e90b76
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CEz+UchdGAP2t+h6D2FWuzyH1LAORqtrJiK0EGqpPtyvNz4nWzo8qAAeHnLGDJoB0KUudKWik4j/fJxIIILP/mvqpnH2hepfZFLomB1tqxDy5VP3VL1MqqE3IF+M/jygw5stvKO2MtSlmWa3cci0/yFsF0eWdQZxt1vSmh6ui5lIERhKICqOTjB09wgTUMX2IWg/YqGGuXwupEVd9bzfeMoQT+Q1bs+XKpScGfPn9GEYWEXtzvw6KqwPxdSUO197JnHKNl78l4upPQP9+W1WgaxJTw1qxiSVRGklp4rzr66bhsD3BvRbCTzwcsUAKpJ2OifgMxMNNzeBtuUzndSDDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUoK2vfRlr5hPn0qnnmWHphQJK115+ItmFJpMWV1aGg=;
 b=P0SakBKsGxTVP3EjeIz84yRYiKb8O/ochXITWkNxjaZzZM/ZLReAR7zudMA0zncjmLtHMDcs0qEZLpYzFwdjkFhHcHmeqYGRmVGpFr471FhVD5wXNDHf/Us8IPzwxaEm/xM0bZGgdjsiC9nb/0AEaEkWamvpJsHBdf3M5cLUujm29GwjHT+Fq5h3llxapytwWbZkP4V5DHy6r5IYiIJ1rELa6M1hOENi/0FEYHWnlFYG6060LQBj6Z+EZZMnuNQdy2CMwDpVNyEHsze55deV/UO5JPBiMXdVLn+1vuZyR8rwDVhnT44y45B+2LaEkLf8914w0UPzZ75iNtTlSXnEmg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUoK2vfRlr5hPn0qnnmWHphQJK115+ItmFJpMWV1aGg=;
 b=GLmADv+0z+Apv1ljE7fGmagEzEVwvyizR/p+6kGvDVSIxC4l2asKB6BzEtQGiQIH2SqeeXY9q9J6BtncBd4yxHjxesmAdE9SThGJdDe8FQy9k8n469+PnE1RO4WWgHCCCu0WeAKMLkot0r7U2zPcEpYX2oLvmAExWi1cbC19QIo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZH+qxWGcyHpcxPGtwA+t8FkMNnAPWoplI9BkeG9Pbk70jIZ7iGT4q/jCBHupOuSePfscxYL527ZNPHZlerou47NB5sxHOINlZc/odDVVmiPw+7znvi+uF2janr2kfr11UJaKH2cNl6NabfSIapt8lHi2agG+pni5oBT7y0ERnmS907Q3g69rOsv20kauyAFF2FQMl/YuAvZRZH8SAUajxu0CfduBUfBCCMLBK2uabHI/xrRozRZTOfHBJCNN8fqOr9vCn8D4wdLOPuFNkXqjkvoDwL4/brZ6kdp4UUJexRLr30M6QFQ8SgL60lAEPfU/7Bhqxi7kIBopO4sFKc67rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUoK2vfRlr5hPn0qnnmWHphQJK115+ItmFJpMWV1aGg=;
 b=h/SsVdCKYYqhn9jHe+xQ40/SW2TZ3JUqIkNxvxfG3DmFk3fKcY6U20KeLwHJoLloFe4oTTxs7RfHcWIQKmTyaiHxKQRKogde9saxzwjv5P7CYY+1pXVa69dsIra7C6g7VoKMhzCsrdUDBClbXSQD3ZoB64WOesgiqoSyaCCdA1VOWZrP/rm+duirUgvtPn7I+fdjP9g6qVroZU0pma7FvAQ/Akete6P0xU2WNOfK8IkOWanBMyv7UgmqEJID/+VuD7+bNQ72KGMsvo/rzwIAgJ7Y2CHwOMihVbRufhtEY1i5DSNL+Nqsx/Gv07LQ8CPMXgephb/8gVly4g98Ae/Fgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUoK2vfRlr5hPn0qnnmWHphQJK115+ItmFJpMWV1aGg=;
 b=GLmADv+0z+Apv1ljE7fGmagEzEVwvyizR/p+6kGvDVSIxC4l2asKB6BzEtQGiQIH2SqeeXY9q9J6BtncBd4yxHjxesmAdE9SThGJdDe8FQy9k8n469+PnE1RO4WWgHCCCu0WeAKMLkot0r7U2zPcEpYX2oLvmAExWi1cbC19QIo=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: RE: [PATCH v6 7/9] xen/arm: unpopulate memory when domain is static
Thread-Topic: [PATCH v6 7/9] xen/arm: unpopulate memory when domain is static
Thread-Index: AQHYekCZzsveZhnerUWxbO0gDoOu8a1DqumAgAK/JFA=
Date: Thu, 9 Jun 2022 03:23:40 +0000
Message-ID:
 <DU2PR08MB7325DCCA62FCA3620E6FB600F7A79@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-8-Penny.Zheng@arm.com>
 <72bec2ab-13d7-8de9-6bb9-f1e4f9de6a3b@xen.org>
In-Reply-To: <72bec2ab-13d7-8de9-6bb9-f1e4f9de6a3b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 920E9DAC76B4FD428F28966B86889C37.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 27d1ee54-1d6d-4e6c-cc98-08da49c77b4c
x-ms-traffictypediagnostic:
	AM6PR08MB5015:EE_|DBAEUR03FT009:EE_|VI1PR08MB3568:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3568CC227B805DF49BE04146F7A79@VI1PR08MB3568.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 chV6tW7JbiNBaKeLqQarq8enXJ4plk6RH1YARHraMRkqRR7bkFO3oAZT947Cskaa3QWK9+W4npAUkkSEaPGsisLndfk3iNExyqJvh2bopDI22R6cn+g8UDS9EYf9TN//iN73uuNm5rD+muiw0MZmqcHi1muEmID+L1zyUFlql6mneYa/PaSO5joKxQPHbRhFtPDxLSn864GEVFv+bC0mj90AvP5oIp9+iwrMtQ72MJvMwNEESS8xTFMdk+vUk9GUilf+65Ilzoxutnu4mcFk2YTp1MbUSNJQcFEEf9O8i+/mT2WKsETALqEoAmwIuAoZ300a4LOCXkpSGnIcaPGoPAlnU1+YfyQwLkTPWQMqL0TFmGL1s9aqJAmKN7mzKpH7d97pxc/5LM+fmJrbV2X68at/iCSNh7dXTNd447yOz7K4NBQKCmFSweVu9OcFYmfvamcStEPVW4omPdwC1BL/TDhbYD2xzdU+umZOv/Ys7HnnAPsSXYEmWuIPPWQyFIvkQfiLvKTWSKxr+K19FKhdgBmi93x8DX0qk25mMD0sATgXS8H6Ja6VE2D+RL0J/+dHeZMQZPkrzVRv0w8O9+qZvFiyfyoh5UhHKNKDKKD4UF+tpAQxZHcxcmHkOKH78dCvuGoHpaUnInGaK+I9pV3ImY8Qa3xMFmuTZwcfBfMLhbz1/O9DLhwBSpNqoGPohCC6uK5Xezzj4tgdy6CuK1sSlg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(55016003)(83380400001)(71200400001)(2906002)(33656002)(6506007)(53546011)(7696005)(9686003)(26005)(186003)(38070700005)(8936002)(122000001)(52536014)(54906003)(110136005)(316002)(64756008)(66946007)(76116006)(66476007)(8676002)(4326008)(66556008)(66446008)(86362001)(5660300002)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5015
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	33a79481-0afc-4693-845c-08da49c77309
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dQt3qtZ5ICc6X+YsZwhLm+/80Im7MlV5aZFqJFYsnRr7zBqYKUQ7rzX6+tZ9Ws/CB54lw9KZjWyueFe/KBKEY8soYUHjKVzHTac6FLk6VoMwIdSJ5IVtpKBdNRnleF+DFhrloEVK+3sWq5HUoNS6dCgfGq/Bx4ucg0N8Ok0OfWIWdupf6nl9tmoCn2tNcsscN9oRzGfF90XGUzdHnf7KTnfFPBWvsZQvMQ/BGlA20KuvU+uT9hiLHsc4nznTdwrpimZkqOomcT0VA7GcQ0ayWiUO6SBIjDYGPj3J8tbquQLUjOxlshydg/4RqTaiTrRPFqBtd3GycBuKWnOV+knQWZo/HQIHe3NkvO2IzZ9H+TbhmErl06EXgrCu3QV02u4McveVA31i5qQ7QlJp4BWdoa03xAC1f3WnMud1QXVoxo84+Fv/BAdN05x4bztoEWGqfaqo1k/xoIYLTSK/jXTv1KUvEMGvg27NY/Mq3njrPQIs2/Ioq49AyCDZVc7ZykI+GvnPKiWpj3GW1v8oTtfSTmBz8i7ZvgXQjf0+9HOnyeVAb74zlGJwzsXKgRfQeOOT8GJDUx29iWESrY4C506U0rUAPzHLEXTQT4J0lkrmIvG8H/6fEYH3cwb7bWPuDT8tQuVzhgcoIAjgXe88aSUMjJExdKBdaBKL+7oI0atjzTQgrHDtqpUh9CamViD42pHP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2906002)(70206006)(70586007)(83380400001)(6506007)(7696005)(4326008)(52536014)(8676002)(53546011)(8936002)(316002)(110136005)(336012)(33656002)(47076005)(54906003)(356005)(81166007)(86362001)(508600001)(82310400005)(5660300002)(26005)(36860700001)(40460700003)(9686003)(55016003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 03:23:54.2140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d1ee54-1d6d-4e6c-cc98-08da49c77b4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3568

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgSnVuZSA3LCAyMDIyIDU6
MjAgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5k
IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+IFZvbG9keW15ciBCYWJjaHVr
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+Ow0KPiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDcvOV0geGVuL2FybTogdW5wb3B1bGF0ZSBt
ZW1vcnkgd2hlbiBkb21haW4gaXMNCj4gc3RhdGljDQo+IA0KPiBIaSBQZW5ueSwNCj4gDQo+IE9u
IDA3LzA2LzIwMjIgMDg6MzAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IFRvZGF5IHdoZW4gYSBk
b21haW4gdW5wb3B1bGF0ZXMgdGhlIG1lbW9yeSBvbiBydW50aW1lLCB0aGV5IHdpbGwNCj4gPiBh
bHdheXMgaGFuZCB0aGUgbWVtb3J5IGJhY2sgdG8gdGhlIGhlYXAgYWxsb2NhdG9yLiBBbmQgaXQg
d2lsbCBiZSBhDQo+ID4gcHJvYmxlbSBpZiBkb21haW4gaXMgc3RhdGljLg0KPiA+DQo+ID4gUGFn
ZXMgYXMgZ3Vlc3QgUkFNIGZvciBzdGF0aWMgZG9tYWluIHNoYWxsIGJlIHJlc2VydmVkIHRvIG9u
bHkgdGhpcw0KPiA+IGRvbWFpbiBhbmQgbm90IGJlIHVzZWQgZm9yIGFueSBvdGhlciBwdXJwb3Nl
cywgc28gdGhleSBzaGFsbCBuZXZlciBnbw0KPiA+IGJhY2sgdG8gaGVhcCBhbGxvY2F0b3IuDQo+
ID4NCj4gPiBUaGlzIGNvbW1pdCBwdXRzIHJlc2VydmVkIHBhZ2VzIG9uIHRoZSBuZXcgbGlzdCBy
ZXN2X3BhZ2VfbGlzdCBvbmx5DQo+ID4gYWZ0ZXIgaGF2aW5nIHRha2VuIHRoZW0gb2ZmIHRoZSAi
bm9ybWFsIiBsaXN0LCB3aGVuIHRoZSBsYXN0IHJlZiBkcm9wcGVkLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4gQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiAtLS0NCj4gPiB2NiBjaGFuZ2Vz
Og0KPiA+IC0gcmVmaW5lIGluLWNvZGUgY29tbWVudA0KPiA+IC0gbW92ZSBQR0Nfc3RhdGljICFD
T05GSUdfU1RBVElDX01FTU9SWSBkZWZpbml0aW9uIHRvIGNvbW1vbiBoZWFkZXINCj4gDQo+IEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBjaGFuZ2UgaXMgbmVjZXNzYXJ5IGZvciB0aGlzIHBh
dGNoLiBBRkFJQ1QsIGFsbCB0aGUNCj4gdXNlcnMgb2YgUEdDX3N0YXRpYyB3aWxsIGJlIHByb3Rl
Y3RlZCBieSAjaWZkZWYgQ09ORklHX1NUQVRJQ19NRU1PUlkgYW5kDQo+IHRoZXJlZm9yZSBQR0Nf
c3RhdGljIHNob3VsZCBhbHdheXMgYmUgZGVmaW5lZC4NCj4gDQoNClRydWUsIEkgbm90aWNlIHRo
YXQgYXJjaF9mcmVlX2hlYXBfcGFnZSBoYXMgYWxyZWFkeSBiZWVuIGd1YXJkZWQgd2l0aA0KI2lm
ZGVmIENPTkZJR19TVEFUSUNfTUVNT1JZLiBJJ2xsIHJldmVydCB0aGUgY2hhbmdlLg0KDQo+IENo
ZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

