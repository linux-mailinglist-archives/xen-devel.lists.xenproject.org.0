Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE48757790
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565002.882781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgma-0004vN-58; Tue, 18 Jul 2023 09:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565002.882781; Tue, 18 Jul 2023 09:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgma-0004sq-2N; Tue, 18 Jul 2023 09:14:12 +0000
Received: by outflank-mailman (input) for mailman id 565002;
 Tue, 18 Jul 2023 09:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UwZh=DE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qLgmY-0004sk-HV
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:14:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7301fcfd-254b-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 11:14:08 +0200 (CEST)
Received: from DB7PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:10:36::33)
 by AM8PR08MB6468.eurprd08.prod.outlook.com (2603:10a6:20b:360::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 09:14:04 +0000
Received: from DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::1e) by DB7PR05CA0020.outlook.office365.com
 (2603:10a6:10:36::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 09:14:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT004.mail.protection.outlook.com (100.127.142.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Tue, 18 Jul 2023 09:14:03 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Tue, 18 Jul 2023 09:14:02 +0000
Received: from ee74b8148921.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7690EFA7-EFF4-404B-8BEA-8ABD91A8B9C8.1; 
 Tue, 18 Jul 2023 09:13:55 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee74b8148921.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 09:13:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM0PR08MB5393.eurprd08.prod.outlook.com (2603:10a6:208:18c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 09:13:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::c78c:c78a:5ab9:570c]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::c78c:c78a:5ab9:570c%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:13:52 +0000
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
X-Inumbo-ID: 7301fcfd-254b-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0XePkEbSWTJC5UIvpPzrh3dN9VnBa8rDJpqduGckaM=;
 b=0qtx2+SQwEoPJJ+9q0fh4RdIJZdEsecAV4Si4zGzYJO9JYQEhPfIHGxqImCFQH7wE+N6VWk+rc0NroWNMhVHWYt0QOk8TIXCFqmd4/R3LSiYZPdSJXIzW/69GqlHT3BWt4ErBdT0PL8myND+QyS+wOWxLrUHHbE3K/ejwpfKL04=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb3a192d12837cc5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKOT80SddKV+XYl5btqnbBXTMZ4YIL4VrKaSGN8Y400VI93NancgP9xh/jkx9mcFEbsuwZHXYe5lT81HYH5PIAtyXjxtrKiGAyV+TbohiPntMZZE4CSRKgjWQykOVmO6FhygCCg+xoPjpB9+ffohJ9Gr12gIALmbc5VokwqwlJuqmeob6En4RXIq8+gGmfaMY+gx86lpLNcYmMfNfmw4u+2DpAy2n3wjs/kdoKeSnW4WSzQteHi4pvNmBKnOcwg4htgaaThsj+AvEPXf4WKcvqrm2LRQ+sGS/4ROCcZ0Q3gt+lCe7ygUEZt0zP8wB1rwYfKOqrWrBTmnIGcnRWiFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0XePkEbSWTJC5UIvpPzrh3dN9VnBa8rDJpqduGckaM=;
 b=QFUmAwQ5TkpH4kVEUU6pgmtIbrubaV66yuBD+BYQkey7N6gbWY7+52+Fxe3qerKzLBoXNCHIRxmI7rX9wIK8SvQv517EOTB6Z+PBm21Y9gNSgWNcZFgNTjyY/T8jzdkKM/hca461pVi9Zwhcf1++MoMdQR8dc3kw9mir/yzo46dZEBAKeiR/XJbUej4H+Ff8W9W2ho0FWXp7jyYs8BAzRCG8bltn9bBSvEwJobynWL7xl7otfkZOY7ZdvamfwQVZUAmKW6AxNxLTWscUIMSTu0lxxQHSJFfhz/JLpEmvHt9N/lKuRTmep69FZ9qEGJCDA22pTg7lZxS2/6Fx03p0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0XePkEbSWTJC5UIvpPzrh3dN9VnBa8rDJpqduGckaM=;
 b=0qtx2+SQwEoPJJ+9q0fh4RdIJZdEsecAV4Si4zGzYJO9JYQEhPfIHGxqImCFQH7wE+N6VWk+rc0NroWNMhVHWYt0QOk8TIXCFqmd4/R3LSiYZPdSJXIzW/69GqlHT3BWt4ErBdT0PL8myND+QyS+wOWxLrUHHbE3K/ejwpfKL04=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Experiments with clang-format and exclude-list.json
Thread-Topic: Experiments with clang-format and exclude-list.json
Thread-Index: AQHZuVgq6e+RULLXRkC5kSYhxnT0mQ==
Date: Tue, 18 Jul 2023 09:13:50 +0000
Message-ID: <505E6BDD-823F-4337-8FB9-C3294D180E74@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM0PR08MB5393:EE_|DBAEUR03FT004:EE_|AM8PR08MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e151ccf-ce95-46a6-f4a6-08db876f546b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cGVSPsyedCh7N7cDZxwG8qrmuejIEeaK3b+DHsbS1qhNtGzLatwPwC/MozsygDfU4u3O3tdmTmVGmDumAidv5elpQT4F8MKWfgIokaB50QlhwGwEv3fWRx3w0tmLOp4IRfBSBJptuMH40eXhq25+vr5zmpXML7U+FEKDLfGblW3TK9/2z5Q3OHU4WIRojpg9PJygc1konIMruhf+cskgLuLfTu2rLGyFXMUPIVQNrGyX7Ih3HlG7e2Pmaa96qRTTFAV3ZZbQM2CubjlmQxIOenjYBJQQkCL8mM4VzHIKQv7Lg3Fun/SY/oJRC9rqkeqTAebbJ15mpp6gKjYaXGwtFm8FY2T55O4ABCKrZUPOnuloo9GhcvAtugPuKBX/x/b+ilC0B/6gdIj040+zCIby1SV6KOh7a/etvE5dJj8gZhLXTxxjaTThuMLkYTHxVu9ws9VZUx5OqGqBnGOlY04jHzYVQnRDcBoOkyQXxH9bxrMOtN8Lc7sM/41no+xNOpfg33R9Mq8cKmgYcgrUa2/eCtKmDF802MUN8eetqW0Np6u+dDuRQZ5jZirgX+4/igKwmDP7tILJvMcskQPcUVmhtLUzxYmO2lmPCHU3E+2TWgZPIB036Cl4L/e4MGUU54H4KoENi1cQjF5fwg+qSX4atHomvTwdRJ/DvJ0d0NBmEjbtAss/VOZgZ71Yt9E6FsKztM5nGPDH/B/bn4b46kAuYw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(6486002)(6506007)(26005)(36756003)(122000001)(86362001)(2616005)(83380400001)(38070700005)(38100700002)(33656002)(186003)(6512007)(54906003)(8676002)(8936002)(4744005)(2906002)(41300700001)(478600001)(91956017)(4326008)(76116006)(316002)(6916009)(64756008)(66476007)(66446008)(5660300002)(66946007)(66556008)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9A1C9A3645AC84C93507E5C5773F6E4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	519739aa-16f7-4dc5-c926-08db876f4cf1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ur0YLSPZf59K6x9rWGGbbkfnIjV1llgj7ObcFA1N2JWWqJom+yyKSiEoUEIAKHBU0OW6np37rCHIXd/I93u/oeMkjRAGHDxCLsMSVN83Y8jrU71NuNISvFCWiC+Ed/LRuDs60wxNevKWVYlf0CiZfvvofkfSEQeAuGpVt4umhG5Z1ngVUWi8GQ9lSdhMreGGNaBH2Oa2MH4DLI/QBrKNsLMiQ/o63m3UJSrYe0R1HMZNVFf+Qh6FKhn1zM7y4Nssk9ukS6RxAXGHE0i50IAk8gG22ls5fMk1rRTsfmRvjj7r190KhHxAAilm/uokw5aCZZMJxfc0NrBTZscM9pZY5syZiv5BHB/DeCOIqjo9Jqy71iv6tmi1ZxRTd0sZaYayKn1LpJ3FBs0o/M403g17JmLlx+Q7WlOGf+PvQY90Awwo9JG8PYoYr2lGnRK8G46jqbkb0eRwpX/4xbRIHV3VM4DO1x1UsI13XyE7bQtZ/NqACfyCrBDzNNBV2KGcZK0NvTOrKohEXlO9JrxD1ZxcQSmVjavvTMPDgE779RN0LRHYIj6ebni7n/VXyj3eoC3NPvIrs77yst/RqqQOz/xridHGlY97gIQvToPImJKNrGCiubI7v7dXmz8dOO6vl0i8/Q2NcsUuial7UkSy/QxZkwaLC3sWgFJF3JzthjFpCOzKmwe1dTF4hGWbVmW7gOdT7LjaCw+QkFw6kLs/yRUKTD9pC7p/GyC1/ssbWkF4nSuDHi9mUH+8mAK0b/O+938
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(40480700001)(36756003)(33656002)(81166007)(40460700003)(82740400003)(356005)(2906002)(478600001)(6486002)(41300700001)(4744005)(107886003)(6506007)(26005)(6512007)(54906003)(8936002)(316002)(86362001)(70586007)(70206006)(5660300002)(4326008)(8676002)(6916009)(336012)(2616005)(47076005)(36860700001)(83380400001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:14:03.0381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e151ccf-ce95-46a6-f4a6-08db876f546b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6468

SGkgYWxsLA0KDQpJ4oCZdmUgZG9uZSBzb21lIGV4cGVyaW1lbnQgd2l0aCBjbGFuZy1mb3JtYXQg
YW5kIHRoZSBoeXBlcnZpc29yIGNvZGUgKHhlbi94ZW4vKiopLCBJIGhhZCB0aGUgbmVlZCB0byBl
eGNsdWRlIHNvbWUgZmlsZXMgZnJvbSB0aGUgdG9vbA0KYW5kIEkgdGhvdWdodCB0byB1c2UgdGhl
IGV4Y2x1ZGUtbGlzdC5qc29uLCBidXQgc2luY2UgaXQgd2FzIGludGVuZGVkIGZvciBNSVNSQSwg
SeKAmW0gbm93IGFza2luZyB5b3VyIGZlZWRiYWNrIGFib3V0IHRoYXQuDQoNCkluIG15IG9waW5p
b24gaXQgY291bGQgbWFrZSBzZW5zZSwgYmVjYXVzZSB3aXRoIHRoYXQgbGlzdCB3ZSBhcmUgZXhj
bHVkaW5nIGV2ZXJ5dGhpbmcgdGhhdCBpcyBleHRlcm5hbCBhbmQgbm90IGFkb3B0aW5nIHRoZSBY
ZW4NCmNvZGluZyBzdHlsZS4NCg0KRG8geW91IGhhdmUgYW4gb3BpbmlvbiBvbiB0aGF0PyBDYW4g
aXQgYmUgb25lIGZpbGU/IE9yIHNob3VsZCBpdCBiZSBhIHNlcGFyYXRlIGZpbGUgb25seSBmb3Ig
dGhlIGNvZGluZyBzdHlsZSBleGNsdXNpb24/DQoNCkNoZWVycywNCkx1Y2ENCg0K

