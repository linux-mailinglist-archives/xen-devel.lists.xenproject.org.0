Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D226E0F9A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 16:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520797.808819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxaH-0000Tx-Lz; Thu, 13 Apr 2023 14:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520797.808819; Thu, 13 Apr 2023 14:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxaH-0000Rz-IB; Thu, 13 Apr 2023 14:05:57 +0000
Received: by outflank-mailman (input) for mailman id 520797;
 Thu, 13 Apr 2023 14:05:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HU9H=AE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pmxaG-0000Rt-Jg
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 14:05:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e115510-da04-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 16:05:55 +0200 (CEST)
Received: from DUZP191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::16)
 by GV2PR08MB7932.eurprd08.prod.outlook.com (2603:10a6:150:7f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 14:05:52 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4f9:cafe::ef) by DUZP191CA0006.outlook.office365.com
 (2603:10a6:10:4f9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 14:05:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Thu, 13 Apr 2023 14:05:52 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Thu, 13 Apr 2023 14:05:52 +0000
Received: from 5bcdf09bd711.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 26D03264-6603-41F1-A6C6-DE02BF857EC2.1; 
 Thu, 13 Apr 2023 14:05:45 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5bcdf09bd711.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 14:05:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB6065.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 14:05:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 14:05:33 +0000
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
X-Inumbo-ID: 4e115510-da04-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ntKU0qB25tzCe84Gkqv7uUIcg8aNldac8nLZ9xZICc=;
 b=hkaD3G9Oykzo1gRrBqfG2zy+phaZeCD5vO1exVMLeLSEgqjS+XQlDjIjDHvKvYUs0sF+os76DGWcnTSDPFkx9nKl6jtrhLKUcUzrkD3EoJ8TndmavVSxTg8YyynJ91MIJsJ18MeATSoqHF6AAZemjaTVXBBO5Jy36sj0V+a2x0Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0a1d0c3ab2b01fb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaf5h/m0A+LxqIE9Q5PBFYjuEuacUNRQUXg2p0HjoBptYKD9sAvIKNEZM1h3l9HLtvdlrka4hhIv0/P3hWG2PEygQWR/WVvKV/7mm95Od78JxCd5IbQe73tO7Xe3xjdcMbefYAjk5KAmQUNFmjRxn263iEvebsm16QENA8f+0V9N/XxagsHzS6jE8OBW9IDxAXyuOoTmpKKQAdiqrgksqVae7rPEqkwaYNpMK43SszCjgqTAaGkTEZOXvfyogpJq27D55yzx/NppI/mIhLFpZ2qrI4ljRQrzPu/6TMHc6n5uXVRVb9NrI3Cop9Lo7HH7IZdZ0OyOYmLRN4pPzoBQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ntKU0qB25tzCe84Gkqv7uUIcg8aNldac8nLZ9xZICc=;
 b=RgT/ACmN4aEFk0yCX/ydcatyZoyjjiJ/+EEx07dX/8/BCwyVFYjF3Xc59bgohYgjKZ69XTItp/oX1XvuaY+nkDT8xj2Ar7EZAKn/JD1ujBdjxMUTG6neg3euohZJP9sS4JGQNYRkgkEcoKz5r+vNGIO2IJeb0C8hq0d+PVBs3vDUwBLHBsTX3V22YLdlDr1/FDrnE2VNVDQaua4hHvspvyoPCAv5+Bx6mBfrs+FowghDIL+nGO/wxlN9IftiKdJcZBQJ60vFAzMZijncYHJtkIDoTbTneFAFP8kRlV2f6Z7IGAziLbor0Dk9fCb7k1P3ZOCeyqOtkI5pDmpSvNvbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ntKU0qB25tzCe84Gkqv7uUIcg8aNldac8nLZ9xZICc=;
 b=hkaD3G9Oykzo1gRrBqfG2zy+phaZeCD5vO1exVMLeLSEgqjS+XQlDjIjDHvKvYUs0sF+os76DGWcnTSDPFkx9nKl6jtrhLKUcUzrkD3EoJ8TndmavVSxTg8YyynJ91MIJsJ18MeATSoqHF6AAZemjaTVXBBO5Jy36sj0V+a2x0Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Topic: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Index: AQHZbSQ9GJqCFHqaX0uCiT+EC9U7s68pNK+AgAAHnICAAAGIAIAACdqA
Date: Thu, 13 Apr 2023 14:05:30 +0000
Message-ID: <4F5DC5EC-F538-42CE-A93F-2B5E3FAC13BB@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-3-luca.fancellu@arm.com>
 <72f38b2b-a391-fb7c-f8c0-cf3561470875@xen.org>
 <B3A82639-6D61-4DA2-B918-A92A421C75D3@arm.com>
 <e8075849-8bd5-7fd4-efaa-81e48c867635@xen.org>
In-Reply-To: <e8075849-8bd5-7fd4-efaa-81e48c867635@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB6065:EE_|DBAEUR03FT018:EE_|GV2PR08MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b15dd7f-6a45-4d9f-ef28-08db3c283124
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RgSznKWfxl8m3Ahu1CbR/Hfg6/lvGHsldj3WMY7SsCvKIe5969I2Gj7jfsRrE56RtPof6+DuMXHzB4CCCZhAtQYQx5iL74BkeRNWNZJklmMedis0xB2E1CZ9o4fwWXbpISfcQzkmvpgAnEskXViozI4EPBKyTWe9Hde2TYX337QBputjqbbGbjthmvidf8XqwoA+67Sog92t3oAZgmHceUEb5DZCJfK4buNKuHc0CBEpWqeByc8MRD1PyuoaLOYsQChdik2tMZXQoTThhJpgYNL8rqaVv88jFKk6vx+i+utOuY8Nr6UVaRh6kZXrObAf4g2VAp4Hew5a+8IOE7AlOvdJuVETqH6PPhiaUjyohBf5ZEgCPmecYI5F3FTaCd6+8t4v24KpFLEIynXL3z1FvLPWcifWDnK9CluQsvv0usCPjvWWtv2eR9HeVq8+Pue8VU9Ut7Znh3SOQ6nscYxcCwmDQt4QiWWgfeBn3u8uhYZ1X3DWVba6AONLeXbx9wze6kZV19qYTr4WXQj9EPWQocWyUKAVPIiwCa28hzp8LijlLsy1Rvb3h5nrIj4SkHbXori8LxdEp9HUfNojTGfFbSfXh8IaBqx8kjZVT3p5Uf50XJE1dzh2SqCXxKYf08YLrP6jyaaztDceIpHcKSX0uw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199021)(5660300002)(41300700001)(33656002)(122000001)(38100700002)(36756003)(2906002)(38070700005)(8676002)(86362001)(4326008)(6916009)(66556008)(8936002)(66446008)(66946007)(64756008)(66476007)(316002)(91956017)(2616005)(83380400001)(76116006)(6506007)(54906003)(6512007)(26005)(53546011)(186003)(478600001)(6486002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C2C74ED4696DC4795D6E4B68AB82C1F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6065
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d14a642-65c9-4dd4-0ac0-08db3c2823df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U4H9aoFTTh8dL3+X2PYAz7MwzphRRA4OkVBNNru9NFDjvKl7vgaYlOzRD67HafqYX28w+q7wQoY1jG/TJeTAt9tiwGj159q7djXl6Up6xV3xWg9RzG2djIoMvGWkqGPIGr2D8FaIlky2OdEibWqSxpYhg9pVZunrbIjxZpbSWdskbVsGONsA7DEz7rCKGmUjv7JCPJwYg9WvuJ9phuPMuxnlD722lQPKdNdpuo3oK3u+2jBUxVm16t0SzAgeepHSuXGYenpTmZaK/fGF53HhEAYPO/9+z5pKJcZVbllaYbsxlNXl+66lFqwp71yEm5TEf0V6ODZlBdYyauYzR7GTRuy/QVfZSA5QHcAinDXsVA9juPh+HQ0Fc/GYD0xm4rQLvgpH+6hx5Cz8/UyYfSfv8OoE1v2gbu90LC7O60zwIijl95l0nnRJI8FEqH3M+Ju2HHbwMukkTwbkE+rC4dGcWWKPW+n0cs1O3pCkVtDf7mDtoYtgMFf/aUG8NGLmtPhzUuLx1cMh//fS8W0qhMuuInsvb38w6EW4wtNxTBetU3V6/Pw8/S2Pma3a+ifBCxrgu5GkaV2+YZc2pf+JFPvO3DlQ/oPObroYySuhwHtg2Ags5G/ZlUlEnicOsZbJKtu5CcfU1QioOKPmNyHh8ZyRR/ysDs/L6IZWAoOWRl7ymxq9SgCjVN2RzPXsqvuwp7BvxM026VjzPhHC19Iep4u1bA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(86362001)(478600001)(54906003)(6486002)(36860700001)(47076005)(36756003)(2616005)(33656002)(336012)(83380400001)(26005)(40480700001)(186003)(6512007)(6506007)(53546011)(40460700003)(82740400003)(82310400005)(81166007)(316002)(356005)(4326008)(2906002)(70206006)(70586007)(8676002)(8936002)(5660300002)(6862004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 14:05:52.3763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b15dd7f-6a45-4d9f-ef28-08db3c283124
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7932

DQoNCj4gT24gMTMgQXByIDIwMjMsIGF0IDE0OjMwLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTMvMDQvMjAyMyAxNDoyNCwgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPj4+PiAgQEAg
LTU5NCw2ICs1OTcsNyBAQCBpbnQgYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4
ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0KPj4+PiAgICAgIHVuc2lnbmVkIGludCBt
YXhfdmNwdXM7DQo+Pj4+ICAgICAgdW5zaWduZWQgaW50IGZsYWdzX3JlcXVpcmVkID0gKFhFTl9E
T01DVExfQ0RGX2h2bSB8IFhFTl9ET01DVExfQ0RGX2hhcCk7DQo+Pj4+ICAgICAgdW5zaWduZWQg
aW50IGZsYWdzX29wdGlvbmFsID0gKFhFTl9ET01DVExfQ0RGX2lvbW11IHwgWEVOX0RPTUNUTF9D
REZfdnBtdSk7DQo+Pj4+ICsgICAgdW5zaWduZWQgaW50IHN2ZV92bF9iaXRzID0gc3ZlX2RlY29k
ZV92bChjb25maWctPmFyY2guc3ZlX3ZsKTsNCj4+Pj4gICAgICAgIGlmICggKGNvbmZpZy0+Zmxh
Z3MgJiB+ZmxhZ3Nfb3B0aW9uYWwpICE9IGZsYWdzX3JlcXVpcmVkICkNCj4+Pj4gICAgICB7DQo+
Pj4+IEBAIC02MDIsNiArNjA2LDI2IEBAIGludCBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWco
c3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+Pj4+ICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPj4+PiAgICAgIH0NCj4+Pj4gICsgICAgLyogQ2hlY2sgZmVhdHVyZSBm
bGFncyAqLw0KPj4+PiArICAgIGlmICggc3ZlX3ZsX2JpdHMgPiAwICkNCj4+Pj4gKyAgICB7DQo+
Pj4+ICsgICAgICAgIHVuc2lnbmVkIGludCB6Y3JfbWF4X2JpdHMgPSBnZXRfc3lzX3ZsX2xlbigp
Ow0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGlmICggIXpjcl9tYXhfYml0cyApDQo+Pj4+ICsgICAg
ICAgIHsNCj4+Pj4gKyAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJTVkUgaXMgdW5z
dXBwb3J0ZWQgb24gdGhpcyBtYWNoaW5lLlxuIik7DQo+Pj4+ICsgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4+Pj4gKyAgICAgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGlmICggc3Zl
X3ZsX2JpdHMgPiB6Y3JfbWF4X2JpdHMgKQ0KPj4+PiArICAgICAgICB7DQo+Pj4+ICsgICAgICAg
ICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAiUmVx
dWVzdGVkIFNWRSB2ZWN0b3IgbGVuZ3RoICgldSkgPiBzdXBwb3J0ZWQgbGVuZ3RoICgldSlcbiIs
DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgIHN2ZV92bF9iaXRzLCB6Y3JfbWF4X2JpdHMpOw0K
Pj4+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+ICsgICAgICAgIH0NCj4+PiAN
Cj4+PiBJcyBTVkUgc3VwcG9ydGVkIGZvciAzMi1iaXQgZ3Vlc3Q/IElmIG5vdCwgdGhlbiB5b3Ug
c2hvdWxkIGhhZCBhIGNoZWNrIGhlcmUgdG8gcHJldmVudCB0aGUgY3JlYXRpb24gb2YgdGhlIGRv
bWFpbiBpZiBzdmVfdmxfYml0cyBpcyBzZXQuDQo+PiBObyBTVkUgaXMgbm90IHN1cHBvcnRlZCBm
b3IgMzIgYml0IGd1ZXN0cywgaGVyZSBJIHRoaW5rIHdlIHdpbGwgZ2V0IOKAnFNWRSBpcyB1bnN1
cHBvcnRlZCBvbiB0aGlzIG1hY2hpbmXigJ0gYmVjYXVzZSBnZXRfc3lzX3ZsX2xlbigpIHdpbGwg
cmV0dXJuIDAuDQo+IA0KPiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIGdldF9zeXNfdmxfbGVuKCkg
d2lsbCByZXR1cm4gdGhlIGxlbiBzdXBwb3J0ZWQgYnkgdGhlIGhvc3RzLiBTbyBpZiB5b3UgcnVu
IGEgMzItYml0IGd1ZXN0IG9uIHRvcCBvZiBhIDY0LWJpdCBob3N0cywgdGhlbiBJIGJlbGlldmUg
Z2V0X3N5c192bF9sZW4oKSB3aWxsIGJlIG5vbi16ZXJvLg0KDQpZZXMgeW91IGFyZSByaWdodCwg
SSByZWFsaXNlIHRoYXQgSSBuZWVkIHRoZSBkb21haW4gdHlwZSBpbmZvcm1hdGlvbiBhbmQgSSBj
YW7igJl0IGhhdmUgaXQgaW4gYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnLCBob3dldmVyIHRo
ZXkgbWlnaHQgaGF2ZSBzZW5zZSB0aGVyZSwgYW5kIEkgY2FuIGRvIGEgY2hlY2sNCmxpa2UgdGhp
cyBhZnRlcndhcmRzOg0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQppbmRleCBjMWYwZDFkNzg0MzEuLmNlMTIz
NWMyNTc2OSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KKysrIGIv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQpAQCAtMzY5NCw2ICszNjk0LDEyIEBAIHN0YXRp
YyBpbnQgX19pbml0IGNvbnN0cnVjdF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtl
cm5lbF9pbmZvICpraW5mbykNCiAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KICAgICB9DQogDQor
ICAgIGlmICggZC0+YXJjaC5zdmVfdmwgJiYgKGtpbmZvLT50eXBlID09IERPTUFJTl8zMkJJVCkg
KQ0KKyAgICB7DQorICAgICAgICBwcmludGsoIlNWRSBpcyBub3QgYXZhaWxhYmxlIGZvciAzMi1i
aXQgZG9tYWluXG4iKTsNCisgICAgICAgIHJldHVybiAtRUlOVkFMOw0KKyAgICB9DQorDQogICAg
IGlmICggaXNfNjRiaXRfZG9tYWluKGQpICkNCiAgICAgICAgIHZjcHVfc3dpdGNoX3RvX2FhcmNo
NjRfbW9kZSh2KTsNCg0KV291bGQgaXQgYmUgb2sgZm9yIHlvdT8NCg0KDQo+IA0KPj4+IENhbiB3
ZSBtb3ZlIHRoaXMgc29tZXdoZXJlIGVsc2UgdG8gYXZvaWQgYWRkaW5nIGV4dHJhIHBhZGRpbmc/
IEFsc28gc2hvdWxkbid0IHRoaXMgYmUgcHJvdGVjdGVkIHdpdGggI2lmZGVmIENPTkZJR19BUk1f
NjQgdG8gbWFrZSBjbGVhciB0aGlzIGlzIG5vdCBzdXBwb3J0ZWQgb24gWGVuIDMyLWJpdD8NCj4+
IFllcywgSeKAmWxsIG1vdmUgaXQgYW5kIHByb3RlY3Qgd2l0aCBDT05GSUdfQVJNXzY0LCBpcyBp
dCBvayBmb3IgeW91IGlmIEkgbW92ZSBpdCBhZnRlcjoNCj4+IC8qIE1vbml0b3Igb3B0aW9ucyAq
Lw0KPj4gc3RydWN0IHsNCj4+ICAgICB1aW50OF90IHByaXZpbGVnZWRfY2FsbF9lbmFibGVkIDog
MTsNCj4+IH0gbW9uaXRvcjsNCj4gDQo+IFBsZWFzZSBjaGVjayB0aGUgcGFkZGluZyB3aXRoICJw
YWhvbGUiLiBJZiBwb3NzaWJsZSwgaXQgd291bGQgYmUgYmV0dGVyIHRvIHJlLXVzZSBhbiBleGlz
dGluZyBvbmUuDQoNCk9rIEnigJlsbCB0cnkgdG8gdXNlIHRoZSB0b29sDQoNCj4gDQo+IENoZWVy
cywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0KDQo=

