Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07337750F34
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 19:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562711.879475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJdFf-0007hV-3h; Wed, 12 Jul 2023 17:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562711.879475; Wed, 12 Jul 2023 17:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJdFf-0007fH-06; Wed, 12 Jul 2023 17:03:43 +0000
Received: by outflank-mailman (input) for mailman id 562711;
 Wed, 12 Jul 2023 17:03:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlNA=C6=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1qJdFd-0007fB-8A
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 17:03:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0affd781-20d6-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 19:03:38 +0200 (CEST)
Received: from DU2PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:10:234::20)
 by DBAPR08MB5559.eurprd08.prod.outlook.com (2603:10a6:10:1a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 17:03:35 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::5b) by DU2PR04CA0045.outlook.office365.com
 (2603:10a6:10:234::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 17:03:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.22 via Frontend Transport; Wed, 12 Jul 2023 17:03:34 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Wed, 12 Jul 2023 17:03:34 +0000
Received: from f3c486dd6195.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8DA5D342-B2FB-4080-BFCF-C434BABC4E12.1; 
 Wed, 12 Jul 2023 17:03:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3c486dd6195.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 17:03:28 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com (2603:10a6:20b:41f::23)
 by AS8PR08MB5991.eurprd08.prod.outlook.com (2603:10a6:20b:29f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 17:03:26 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::a4db:63a3:ef32:ffd3]) by AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::a4db:63a3:ef32:ffd3%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 17:03:26 +0000
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
X-Inumbo-ID: 0affd781-20d6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ba6Mja8EZteepbYdAvxgOHhUTyOaOw3eVOGNs7AF7b4=;
 b=4uj7+f4tUjKaQdyRp+tHz/53UOjern5e8subKAvbf29n6jL+QodXLuRkqvv5bRohghuvr/i2abky6rYHkgjKWVCaUd/Ys/69UWBSFhNhej48RHxh7U0slZ7jX5KG+kM5aaPwgV3VVYkrNZ7MV543GSohZD8b99NzYcE9HztnHPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2a3b9bfa7c7f57c2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DE8GgiHFLTuuN/wT3rf9TO0YtEI/Kh4V3PU2zoiaGtutYKgYACTefjtVrEa+j5uUZWvn6GQ7hit6tkOSTeK5wHUnNl+EQdmKc7o8R9qidk833dVvGplt8hn/YofLAgw+6+Zn0t7H7pdC24vmhVHaf+G1zt4zxD0wPihqskIITIOXVPQQi2+fc3fIdnA1u+n1n1OUDNfrQkgz7fyUNOcZfPxy//dVenOvoQxb9P5veey3CLej92S64oaZatna/v4deAklwFpw5QuWXa0AQ+2Te6Xc8pO3VDYDK0BMt/HmcH3SnPJ66lMgKP6VnvzOqWxgYm+Cgl/26lmKaNvlq007Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ba6Mja8EZteepbYdAvxgOHhUTyOaOw3eVOGNs7AF7b4=;
 b=WosnRvut5qTaTFxrgWCvswNfbxmEi2zWwKtRShMb9mnr2F3V2tzQla57RFAmjpb51hQhTN4Gu7DwIicXZRh8Ce4K4AKJajf9R/K1PK9mUHHBVJJtNefwwHneIB+8CWnL/HhXgntttS/A6kg0d7rD3PQD0X5YJ2LFLISiNUYTBk7VyMRvk4sBQtSByfaZ96DjQnDMrnmF3Ee3WOEGz1nsBDU4tR4VBNwgxYZxmqnQI5q4/qlLCBv7uQeAOtj3alkX10aCQP2rts0iMh4X9zGhxk7AeIaFtQTThNarhYWeRdkE2SVr0lXBMCp/EW0S2X57A0SbQEUS5xohO6N7/9A5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ba6Mja8EZteepbYdAvxgOHhUTyOaOw3eVOGNs7AF7b4=;
 b=4uj7+f4tUjKaQdyRp+tHz/53UOjern5e8subKAvbf29n6jL+QodXLuRkqvv5bRohghuvr/i2abky6rYHkgjKWVCaUd/Ys/69UWBSFhNhej48RHxh7U0slZ7jX5KG+kM5aaPwgV3VVYkrNZ7MV543GSohZD8b99NzYcE9HztnHPQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] xen/arm: pci: fix check in pci_check_bar()
Thread-Topic: [PATCH v3] xen/arm: pci: fix check in pci_check_bar()
Thread-Index: AQHZtMggOVMN7Efb4EuWVUiRObIz7a+2W9aA
Date: Wed, 12 Jul 2023 17:03:26 +0000
Message-ID: <5DC13CCA-D174-421B-A8DE-B20DEDC8823E@arm.com>
References: <20230712135226.747472-1-stewart.hildebrand@amd.com>
In-Reply-To: <20230712135226.747472-1-stewart.hildebrand@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM9PR08MB7165:EE_|AS8PR08MB5991:EE_|DBAEUR03FT022:EE_|DBAPR08MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0eb872-0c2a-48f3-f568-08db82f9ed8d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v/tLp7jOf8bpXpK0izVFMnTm12hKyuAfoktVwXr9B/ueNk7ch6rTB33ZQ4jNXW2jURLdLVWNDW2uOhQFeVN39T0erDGvE6rQSZkvCLNgCeUf3PLGlaNeSXTacjq11cruWIiWh9E7C40agr1Kbbtwo5G3fx4mzUWitTEgzxmw19tgTdn9jsYQqDrpM9U0vEzkyFMhV5Frwgm6vYYYNvzmqGTpPyL8BaP1p10JX4mD7qPLB8Le7MZqYcus95oweFtQTI+4ZpQtBOlg98w0rhRsui/dU1+FsGd4mC60h3ZcCX91O/e5KlnukTaAScEkhRn0iD7I8Q23wqWiWnr4qTjGZNYngrfKBXQat7NUtT3dSdZHfxFk25KN0TSgQI3jNtNjR1Nb3qgI7MdO0tIjVmdc7mjpzR142Z/vTUaNt6ytuEkL5b+egyFo2zoQmwdH6u/Ytsf/5ctzQGbxjkKcRjwtX5I+/JO3O7NE210EUgrbybHDIjcbFtJYzAuz9YN60xk6qDF1mAwJOvc02ifCIb/ek2bKCJ1q6L+siWJVPcIsiPh4aAneQ4HYpdi0YlYb2exywY9bnRmyVQu0qyMI33/wFdF/6F8rDPPeAacbUcQj7btT+JozpGps6kCxlKx36lYDtDO/dW5+Vhy0TuSMRJ75Ig==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7165.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(66946007)(91956017)(66446008)(64756008)(66476007)(4326008)(6916009)(76116006)(66556008)(478600001)(36756003)(54906003)(86362001)(38070700005)(26005)(6506007)(53546011)(186003)(33656002)(71200400001)(6512007)(6486002)(83380400001)(38100700002)(122000001)(41300700001)(2616005)(8676002)(8936002)(316002)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7707ED5EBEA4F42A67D4E572899740F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5991
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	462ce072-ee98-4e06-0c6e-08db82f9e878
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gsRbEoXpo96mGHwy3ftlKFtPqlyQy9Hr+j4lpdDNnuzSmYEcsF7U3f6FpQ9aPM+KxUsp1MKCjLlQuOcvKwxzY88d6E2m4/SopbDiKZr1OOTkItx9TF65xhw10ZDcDsJz9N14oNG5UtcDhHYl/yRqZhW30LLYBttWK4uQrYvbYnbW/6oaS45JqDa5c94NWaImoiroJMPWeryItuR74dGc8jYbhodC/EILm1BRFGMn9j9EK7cQV900yYZ1sdZxLM+mWwgPzpKTuAdTolMn3fuIjRrqWV5qvXHPpWuZm2IPYzBwAD2VyfShLUBHnFiF/dYoMmM5XGq36jvj1NQpeDF1ONHiUMQXHgDC6sSYtMNE3Xfs4+hZ/u9T0DbHtkMkmQiTyaFMbZICMnmO6DRXFQCeLz4Mrh3dhgzBMOAEa1zDabQEu+ff8qgtD+W6vWFKNKpZidngqdmNu+21UOM+D39/dKfaaFwK92OAApFJ/m9eXrEcrNBZFiyqo8jOgFE+2/oFUXQCg4x+XuW+UflLsuUCtNTEkotyK8ljBDarX7Y1MsIeg9nyKdutkFPQHB2R95m54FEnlFchwnqGB6UIH69tWjkTZZk3YvVETWnmKWe02UNWnV54mksM67DH5dwMwckgU5rMmiskKVjrbSeL9+sjuqF6sUbTLQn2T/iB6jATYyDnRwsCiQioWY228KAXDhMomKSFhkFCTR3LXqGUht230i2Mf8G2So/ly4lq0+jkmFU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(82740400003)(40480700001)(86362001)(40460700003)(36860700001)(36756003)(83380400001)(2906002)(356005)(2616005)(478600001)(107886003)(6486002)(54906003)(26005)(6506007)(53546011)(5660300002)(186003)(6512007)(8676002)(41300700001)(6862004)(8936002)(336012)(47076005)(4326008)(316002)(70206006)(70586007)(81166007)(82310400005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 17:03:34.6872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0eb872-0c2a-48f3-f568-08db82f9ed8d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5559

SGkgU3Rld2FydCwNCg0KPiBPbiAxMiBKdWwgMjAyMywgYXQgMjo1MiBwbSwgU3Rld2FydCBIaWxk
ZWJyYW5kIDxTdGV3YXJ0LkhpbGRlYnJhbmRAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBXaGVuIG1h
cHBpbmcgQkFScyBmb3IgdlBDSSwgaXQncyB2YWxpZCBmb3IgYSBCQVIgbWZuX3Qgc3RhcnQgdG8g
ZXF1YWwgdGhlIEJBUg0KPiBtZm5fdCBlbmQgKGkuZS4gc3RhcnQgPT0gZW5kKSBzaW5jZSBlbmQg
aXMgaW5jbHVzaXZlLiBIb3dldmVyLCBwY2lfY2hlY2tfYmFyKCkNCj4gY3VycmVudGx5IHJldHVy
bnMgZmFsc2UgaW4gdGhpcyBjYXNlLCB3aGljaCByZXN1bHRzIGluIFhlbiBub3QgbWFwcGluZyB0
aGUgQkFSDQo+IGluIHRoZSBndWVzdCAybmQgc3RhZ2UgcGFnZSB0YWJsZXMuIEluIHRoaXMgZXhh
bXBsZSBib290IGxvZywgTGludXggaGFzIG1hcHBlZA0KPiB0aGUgQkFScyBpbiB0aGUgMXN0IHN0
YWdlLCBidXQgc2luY2UgWGVuIGRpZCBub3QgbWFwIHRoZW0gaW4gdGhlIDJuZCBzdGFnZSwNCj4g
TGludXggZW5jb3VudGVycyBhIGRhdGEgYWJvcnQgYW5kIHBhbmljczoNCj4gDQo+IFsgICAgMi41
OTMzMDBdIHBjaSAwMDAwOjAwOjAwLjA6IEJBUiAwOiBhc3NpZ25lZCBbbWVtIDB4NTAwMDgwMDAt
MHg1MDAwOGZmZl0NCj4gWyAgICAyLjU5MzY4Ml0gcGNpIDAwMDA6MDA6MDAuMDogQkFSIDI6IGFz
c2lnbmVkIFttZW0gMHg1MDAwOTAwMC0weDUwMDA5ZmZmXQ0KPiBbICAgIDIuNTk0MDY2XSBwY2kg
MDAwMDowMDowMC4wOiBCQVIgNDogYXNzaWduZWQgW21lbSAweDUwMDBhMDAwLTB4NTAwMGFmZmZd
DQo+IC4uLg0KPiBbICAgIDIuODEwNTAyXSB2aXJ0aW8tcGNpIDAwMDA6MDA6MDAuMDogZW5hYmxp
bmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpDQo+IChYRU4pIDAwMDA6MDA6MDAuMDogbm90IG1hcHBp
bmcgQkFSIFs1MDAwOCwgNTAwMDhdIGludmFsaWQgcG9zaXRpb24NCj4gKFhFTikgMDAwMDowMDow
MC4wOiBub3QgbWFwcGluZyBCQVIgWzUwMDA5LCA1MDAwOV0gaW52YWxpZCBwb3NpdGlvbg0KPiAo
WEVOKSAwMDAwOjAwOjAwLjA6IG5vdCBtYXBwaW5nIEJBUiBbNTAwMGEsIDUwMDBhXSBpbnZhbGlk
IHBvc2l0aW9uDQo+IFsgICAgMi44MTc1MDJdIHZpcnRpby1wY2kgMDAwMDowMDowMC4wOiB2aXJ0
aW9fcGNpOiBsZWF2aW5nIGZvciBsZWdhY3kgZHJpdmVyDQo+IFsgICAgMi44MTc4NTNdIHZpcnRp
by1wY2kgMDAwMDowMDowMC4wOiBlbmFibGluZyBidXMgbWFzdGVyaW5nDQo+IChYRU4pIGFyY2gv
YXJtL3RyYXBzLmM6MTk5MjpkMHYwIEhTUj0weDAwMDAwMDkzMDEwMDQ1IHBjPTB4ZmZmZjgwMDAw
ODk1MDdkNCBndmE9MHhmZmZmODAwMDBjNDZkMDEyIGdwYT0weDAwMDAwMDUwMDA4MDEyDQo+IFsg
ICAgMi44MTgzOTddIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHR0YnIgYWRkcmVzcyBzaXplIGZh
dWx0IGF0IHZpcnR1YWwgYWRkcmVzcyBmZmZmODAwMDBjNDZkMDEyDQo+IC4uLg0KPiANCj4gQWRq
dXN0IHRoZSBlbmQgcGh5c2ljYWwgYWRkcmVzcyBlIHRvIGFjY291bnQgZm9yIHRoZSBmdWxsIHBh
Z2Ugd2hlbiBjb252ZXJ0aW5nDQo+IGZyb20gbWZuLCBhdCB3aGljaCBwb2ludCBzIGFuZCBlIGNh
bm5vdCBiZSBlcXVhbCwgc28gZHJvcCB0aGUgZXF1YWxpdHkgY2hlY2sgaW4NCj4gdGhlIGNvbmRp
dGlvbi4NCj4gDQo+IE5vdGUgdGhhdCBhZGp1c3RpbmcgZSB0byBhY2NvdW50IGZvciB0aGUgZnVs
bCBwYWdlIGFsc28gaW5jcmVhc2VzIHRoZSBhY2N1cmFjeQ0KPiBvZiB0aGUgc3Vic2VxdWVudCBp
c19iYXJfdmFsaWQgY2hlY2suDQo+IA0KPiBGaXhlczogY2M4MGUyYmFiMGQwICgieGVuL3BjaTog
cmVwbGFjZSBjYWxsIHRvIGlzX21lbW9yeV9ob2xlIHRvIHBjaV9jaGVja19iYXIiKQ0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29t
Pg0KPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
DQoNCkkgdGVzdGVkIHRoZSBwYXRjaCBvbiBOMVNEUCBib2FyZCBldmVyeXRoaW5nIHdvcmtzLg0K
DQpSZXZpZXdlZC1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQpUZXN0ZWQt
Ynk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KDQpSZWdhcmRzLA0KUmFodWw=

