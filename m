Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815C7776EF3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 06:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581801.911212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTx2F-0000oy-Fe; Thu, 10 Aug 2023 04:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581801.911212; Thu, 10 Aug 2023 04:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTx2F-0000mB-CO; Thu, 10 Aug 2023 04:12:31 +0000
Received: by outflank-mailman (input) for mailman id 581801;
 Thu, 10 Aug 2023 04:12:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCzd=D3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qTx2E-0000lw-7V
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 04:12:30 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1df0ca85-3734-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 06:12:27 +0200 (CEST)
Received: from AS9PR05CA0230.eurprd05.prod.outlook.com (2603:10a6:20b:494::17)
 by DB9PR08MB8358.eurprd08.prod.outlook.com (2603:10a6:10:3da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 04:12:16 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:494:cafe::83) by AS9PR05CA0230.outlook.office365.com
 (2603:10a6:20b:494::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Thu, 10 Aug 2023 04:12:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Thu, 10 Aug 2023 04:12:15 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Thu, 10 Aug 2023 04:12:15 +0000
Received: from 045161a4d730.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F5C4E51-A802-4BCF-A764-5CFD7F6B0FEC.1; 
 Thu, 10 Aug 2023 04:12:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 045161a4d730.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Aug 2023 04:12:09 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by DB9PR08MB6617.eurprd08.prod.outlook.com (2603:10a6:10:261::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Thu, 10 Aug
 2023 04:12:07 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::19bd:f9b9:756b:f1f6]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::19bd:f9b9:756b:f1f6%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 04:12:06 +0000
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
X-Inumbo-ID: 1df0ca85-3734-11ee-b283-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0EkChZIIJCHJ/QHdflQAoITOqAY/DUvdYi0tgRVvgU=;
 b=TOa2fgZkIDfSbLyCiSMfWJXb28qod1p+hSFTN03UyapMSEggoK13onUqPetT6ZQMokuTJnOkRBHOaoUQwq6BEqaZ0OhcMqmQEvmcoQ2ngynqcRwoRzI8LifqOLH32CN4AxjjaejgLZ7MEUTnCLWOWjRID/MfmpRdnxDOcA35vd0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a0c65f415ea28786
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHSFJUAbQ8zOTPskVMiaKQii6IPs41CMOt5US17d7vXG3QuwioE7t9obZ5C8K+BBhsZT1QUr0jFdeuOZJqkPwa2WSMBQLR6CMohoLE0Wnon+b+e+UsgZQiJrII+W6U2DdCVMqodmP167RDQhH2aNyjgC4CVYvZkJeTWBGxifWcpULp6d5x+1K3q5TZqzYNMtS/8JuFst8t8+NNpjBrwBusLnc4eoqHqccwlrwAqW7bVbOuJJXPCYxj8X2FabFWzekB4ydsKnjgjd+yN8uP+vglumOFPvFHetyy8AUNoD1OjXvtcMYiu0PMBc1tMbpvMs+MlD0MMVWjlJkUJPSnXOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0EkChZIIJCHJ/QHdflQAoITOqAY/DUvdYi0tgRVvgU=;
 b=Y1VCXfsfJC8ooo0eW3FS6tXX7CEP9qJARAUlqbGuPHcfWmo/rG63Wcsa1DiiW5y7sK9nKU9eVGvUodLMkwiUb51Un/5Lee3z9qKThR1x1WV52XIulTNdCc6ws5KVNP50o5mzq3IjVPxJ40snyFdK+11GRTrPvdK4LxbEwWR1hhks1FB7CahYmMgjQUKr3Mfw68doxZXpHyQvdxqBlEWzIR6UTAp6XJeK1E01x/Z8maft63EySfrQXHXi2ZbWEMB9CEfKk7Euf9f96ONqTfibM5UaNV2y6S4VEO0x7Ted8w6HhRZGUT+SHzulLc4PXJ4vI/TBQtx901D6R/KugsQMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0EkChZIIJCHJ/QHdflQAoITOqAY/DUvdYi0tgRVvgU=;
 b=TOa2fgZkIDfSbLyCiSMfWJXb28qod1p+hSFTN03UyapMSEggoK13onUqPetT6ZQMokuTJnOkRBHOaoUQwq6BEqaZ0OhcMqmQEvmcoQ2ngynqcRwoRzI8LifqOLH32CN4AxjjaejgLZ7MEUTnCLWOWjRID/MfmpRdnxDOcA35vd0=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
Thread-Topic: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
Thread-Index: AQHZxCqBtZIUxf7FmUaIEyO8EPs3TK/h6aMAgAEPoIA=
Date: Thu, 10 Aug 2023 04:12:06 +0000
Message-ID: <9D42DF7B-B1E0-4A13-9F84-6CA2B77236D4@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-2-Henry.Wang@arm.com>
 <d1e7a6b0-d3a6-4d85-a26c-019fc67ba463@xen.org>
In-Reply-To: <d1e7a6b0-d3a6-4d85-a26c-019fc67ba463@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB8001:EE_|DB9PR08MB6617:EE_|AM7EUR03FT051:EE_|DB9PR08MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed7b82b-a70f-4a23-8f7b-08db9957fb47
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 biyQVrhcwC7YKf4IVqNfNVLeLi8AHp7U8FH5PoOElQjaxT3mW5EPw2G6RtObLS5GKf/nNRg0eMMJonGBCVKZjl6u33ftWznS/5KFI+0ykI5Aj/uennAcMVKZ8cQBSWSqSLwCMAsnPXIZ0lzxaptSwsl5CNg5/Znx9Zkc1Tlr0McYdFESjspRus4ns93BmWzXRqHLGQBbCrawEoubNeehi4SD4zV29DljPrCDQAbsI/zq4/qcCXzFAqN2PrvTZkwm02I40UAKNm/efivOaua4ixdCxnBYLDlTbbF4SuwvAdO/NzQB/dFPVZp73RQggbSLEquLQAJUCr2cvuyM7+N7CYaS+Kl/1bSSznzRPHAdDlFLNR9urXcNpHT4jhqQFxxd2wGcS+WqydvYcBsOujN4TPZ4zF9olzWvKrbvU8dyUzKMVufz9QbEETc+Y6C8d38i7Wy7zBatySyfSBVlrHwohzyNPs5igaGWfoMVO46ORQNnKkTFNdccNrtEhBLrE5ggLK2jVqT7/zYUstIWu0JuL420TPvk+pLRa1f6Wm6W3PSKqebtju+B1daqXlQ8QDg8McMqettA88oM18PDUpyd/soDWiSOwepoCVs5GaQwFEwP5fjcoID+hlOCotaC1iI7p72mmC+Ihbxw2mu+auO2tw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(1800799006)(186006)(26005)(38100700002)(122000001)(6916009)(6506007)(53546011)(38070700005)(2616005)(36756003)(83380400001)(2906002)(54906003)(5660300002)(478600001)(33656002)(71200400001)(6512007)(66446008)(6486002)(41300700001)(64756008)(66946007)(4326008)(66476007)(76116006)(316002)(91956017)(86362001)(8936002)(66556008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CF4B78AD3D2FC41A941C4B6EDCF33C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6617
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3623c2e8-08a3-4ee1-e19d-08db9957f5c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w9sH8FmRT3MzihYlqE/HYDdnLESwZ3lgx3P7dIs2V/wRx/dlIUobU9+8OLkII+CBj4z1MbVq8dLQ8Nva2BhqHVoeM6dnraLAosfIcLwFcOJFigzcQBr48pfVWlnIoVmv4q060hM5/TDfohDfiDdmPwrTXtEi0bYlnXlPjRX6J7zEG6YhhcXwNoIptIhdUdxHf0W9lDDMD+taRryZodGNVJy2qebEQQrkBfAXQd57/U519hgV4/KIUqtbThEjjSzQIPc8pI4A/HMBvxdcmUBwjTJeGZqgEhljzcdS/aiMxlIMP95CgexU3ETz8Btj2dnGPKJchtK/fLIibbSfXDRve/xl2/Bq7BbIaVhI123Tt9qmjb1Jg42vaHF+WSUBx026Ww9pSERcf9HjiK2V6f6tiNLYmfof2AGSYdxtYc+47WJglvbHqrQ3fR/KjmIgQHuGiiEwfKTimhmFEyNp15bkcahgR1yZVepXKXeJtO++rxi3LdYUAYpTtdih5SfT/Yhwd8s3b/x0hheRU0WLjQYvaZFAySmS+MKlSSLWr3dxXx6KBJLg2FsS/bPRhTcNB48+UWjL0wnBZoG/d4wN4pFml+g5aWojPZSb2Yxl5OZ636WawkNqynTaPzIwP7Bk8ay1KHqrnYnbq7JxCWRzbDAy8IEoaaIQwASL6UyeTxzh/8x8HKhtepwHl5SKRtDr2zH8A4byoG5gd4NlAqSoIMtdoVwwuartIceawq+GKn6+1uyHG8qVwnb7xX9kqTs9+L7p
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(1800799006)(186006)(82310400008)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(70206006)(70586007)(336012)(54906003)(6506007)(53546011)(26005)(478600001)(36756003)(33656002)(47076005)(83380400001)(2616005)(36860700001)(41300700001)(316002)(6512007)(4326008)(6486002)(2906002)(6862004)(8936002)(86362001)(8676002)(82740400003)(5660300002)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 04:12:15.9407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed7b82b-a70f-4a23-8f7b-08db9957fb47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8358

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyA5LCAyMDIzLCBhdCAxOTo1OSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+IFRpdGxlOiBOSVQ6
IEFkZCAoKSBhZnRlciBfbW0gdG8gc3RheSBjb25zaXN0ZW50IHdpdGggdGhlIHJlc3QuDQoNClll
cyBzdXJlLCBJIHdpbGwgYWRkIOKAnCgp4oCdIGluIHY1Lg0KDQo+IA0KPiBPbiAwMS8wOC8yMDIz
IDA0OjQ0LCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gRnJvbTogV2VpIENoZW4gPHdlaS5jaGVuQGFy
bS5jb20+DQo+PiANCj4+ICtlbmFibGVfc2Vjb25kYXJ5X2NwdV9tbToNCj4+ICsgICAgICAgIG1v
diAgIHg1LCBscg0KPj4gKw0KPj4gKyAgICAgICAgbG9hZF9wYWRkciB4MCwgaW5pdF90dGJyDQo+
PiArICAgICAgICBsZHIgICB4MCwgW3gwXQ0KPj4gKw0KPj4gKyAgICAgICAgYmwgICAgZW5hYmxl
X21tdQ0KPj4gKyAgICAgICAgbW92ICAgbHIsIHg1DQo+PiArDQo+PiArICAgICAgICAvKiByZXR1
cm4gdG8gc2Vjb25kYXJ5X3N3aXRjaGVkICovDQo+IA0KPiBUZWNobmljYWxseSwgeW91IHdpbGwg
cmV0dXJuIHRvIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc2V0IGluICdscicuIFRoaXMgaXMgJ3NlY29u
ZGFyeV9zd2l0Y2hlZCcgdG9kYXkgYnV0IHRoaXMgY291bGQgY2hhbmdlLg0KPiANCj4gU28gaXQg
d291bGQgYmUgYmV0dGVyIHRvIGhhdmUgYSBtb3JlIGdlbmVyaWMgY29tbWVudCBsaWtlOg0KPiAN
Cj4gUmV0dXJuIHRvIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcmVxdWVzdGVkIGJ5IHRoZSBjYWxsZXIu
DQoNClN1cmUsIGFuZC4uLg0KDQo+IA0KPj4gKyAgICAgICAgcmV0DQo+PiArRU5EUFJPQyhlbmFi
bGVfc2Vjb25kYXJ5X2NwdV9tbSkNCj4+ICsNCj4+IA0KPj4gKzE6DQo+PiArICAgICAgICAvKg0K
Pj4gKyAgICAgICAgICogVGhlIDE6MSBtYXAgbWF5IGNsYXNoIHdpdGggb3RoZXIgcGFydHMgb2Yg
dGhlIFhlbiB2aXJ0dWFsIG1lbW9yeQ0KPj4gKyAgICAgICAgICogbGF5b3V0LiBBcyBpdCBpcyBu
b3QgdXNlZCBhbnltb3JlLCByZW1vdmUgaXQgY29tcGxldGVseSB0bw0KPj4gKyAgICAgICAgICog
YXZvaWQgaGF2aW5nIHRvIHdvcnJ5IGFib3V0IHJlcGxhY2luZyBleGlzdGluZyBtYXBwaW5nDQo+
PiArICAgICAgICAgKiBhZnRlcndhcmRzLiBGdW5jdGlvbiB3aWxsIHJldHVybiB0byBwcmltYXJ5
X3N3aXRjaGVkLg0KPiANCj4gU2FtZSByZW1hcmsgaGVyZS4NCg0K4oCmc2FtZSBoZXJlLg0KDQo+
IA0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAgICBiICAgICByZW1vdmVfaWRlbnRpdHlfbWFw
cGluZw0KPj4gKw0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIEJlbG93IGlzIHN1cHBv
c2VkIHRvIGJlIHVucmVhY2hhYmxlIGNvZGUsIGFzICJyZXQiIGluDQo+PiArICAgICAgICAgKiBy
ZW1vdmVfaWRlbnRpdHlfbWFwcGluZyB3aWxsIHVzZSB0aGUgcmV0dXJuIGFkZHJlc3MgaW4gTFIg
aW4gYWR2YW5jZS4NCj4+ICsgICAgICAgICAqLw0KPj4gKyAgICAgICAgYiAgICAgZmFpbA0KPiAN
Cj4gTG9va2luZyBhdCB0aGlzIGFnYWluLCBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIGhvdyB0aGlz
IGNvdWxkIHJlYWNoZWQgaWYgcmVtb3ZlX2lkZW50aXR5X21hcHBpbmcgdXNlICdyZXQnIGFuZCB5
b3UgY2FsbCBpdCB3aXRoICdiJy4gU28gSSB3b3VsZCBzdWdnZXN0IHRvIGRyb3AgaXQgYW5kIG1v
dmUgJ21vdiBsciwgeDUnIGNsb3NlciB0byAnYiByZW1vdmVfaWRlbnRpdHlfbWFwcGluZycuIFNv
IGl0IGlzIGNsZWFyZXIgdGhhdCBpdCB3aWxsIHJldHVybi4NCg0KT2ssIEnigJl2ZSBhZGRyZXNz
ZWQgdGhpcyBsb2NhbGx5IGFuZCB0ZXN0ZWQgdGhlIGNoYW5nZSwgWGVuIGFuZCBEb20wIGJvb3QN
CmZpbmUgd2l0aCB0aGUgY2hhbmdlcyB0aGF0IHlvdSBzdWdnZXN0ZWQuIFdpbGwgc2VuZCB2NSBz
b29uIGFmdGVyIGZpeGluZw0KYWxsIHlvdXIgY29tbWVudHMuIFRoYW5rcyENCg0KS2luZCByZWdh
cmRzLA0KSGVucnkNCg0KPiANCj4+ICtFTkRQUk9DKGVuYWJsZV9ib290X2NwdV9tbSkNCj4+ICsN
Cj4+ICAvKg0KPj4gICAqIFJlbW92ZSB0aGUgMToxIG1hcCBmcm9tIHRoZSBwYWdlLXRhYmxlcy4g
SXQgaXMgbm90IGVhc3kgdG8ga2VlcCB0cmFjaw0KPj4gICAqIHdoZXJlIHRoZSAxOjEgbWFwIHdh
cyBtYXBwZWQsIHNvIHdlIHdpbGwgbG9vayBmb3IgdGhlIHRvcC1sZXZlbCBlbnRyeQ0KPiANCj4g
Q2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

