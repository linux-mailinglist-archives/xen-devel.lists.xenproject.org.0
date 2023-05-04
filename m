Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EEF6F6917
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 12:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529678.824333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puWGN-0007E5-SC; Thu, 04 May 2023 10:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529678.824333; Thu, 04 May 2023 10:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puWGN-0007BU-PE; Thu, 04 May 2023 10:32:39 +0000
Received: by outflank-mailman (input) for mailman id 529678;
 Thu, 04 May 2023 10:32:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VaLI=AZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1puWGM-0006cv-Ow
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 10:32:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcccc8a3-ea66-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 12:32:37 +0200 (CEST)
Received: from AM6P193CA0141.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::46)
 by DB9PR08MB8459.eurprd08.prod.outlook.com (2603:10a6:10:3d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 10:32:34 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::c9) by AM6P193CA0141.outlook.office365.com
 (2603:10a6:209:85::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 10:32:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.25 via Frontend Transport; Thu, 4 May 2023 10:32:34 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Thu, 04 May 2023 10:32:34 +0000
Received: from 271d7a319c8c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9592A008-E23D-425A-A8BD-D97393C9E3CB.1; 
 Thu, 04 May 2023 10:32:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 271d7a319c8c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 10:32:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9792.eurprd08.prod.outlook.com (2603:10a6:20b:613::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Thu, 4 May
 2023 10:32:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::9283:e527:bed8:ab23]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::9283:e527:bed8:ab23%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 10:32:22 +0000
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
X-Inumbo-ID: fcccc8a3-ea66-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gd/NjnaXxNh81P765sCdBk6OvwGARw4SD4t12/DyxQw=;
 b=ZyvS3wWe19J70ts/P63elgFhe3LB4hHIpsRk5ezjMvRdQ/NoYRD6rXDyiZsSWl55WO0J5CibrYej3B1M02JIv6wTNh8MbTViqFVhl1D7u8tV3Qoxoc86tLpjtyn+cqG02xpHPAh22el68Bq9EziRRFBs94wY1s7gq1VH+xeEzjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31291b0853fa72b4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIzjCFJz3L37hTwIw1CdETIrhR6uSxgwwQG/66xSrWotr5nHwlqLJqjrXavo+1uUsBDyK1IxbMmZMurU6algKceJhGXP9GPyXVPkZ+HhDDtzM/GPY4XiVGoDdoaZFZvCBSi71CUtve5nP+2KN0LuQSn2nT4R3nDAAMiLHgeYg9HosI2ZZKBJinlPzuVnkwJi89OBRA2KOp/XSHuszy19Xnqj0uVl4a666h7H5fm6c1EkKYwXH5hB2V+BzY+9Mq6anL3MaE6adXgOST1bWTEbhkwVIIVJCaCgOrm1Jl7AlV6uKTa11gUx+Dhhph9NP05afkXPAoEklbmF2rWB62jn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gd/NjnaXxNh81P765sCdBk6OvwGARw4SD4t12/DyxQw=;
 b=HZc/CCtlnYBzuwiGvKLPBhHpmpxxxoAyOeAemgnrNFNnE3PDtZZPL//M99IBW1TiOKBftngkdgP/QHhz5WmOxp2O3n3O4ohUKevfMZw2i35yF0uOWC3ECS90we2PliIT+T8PC+YKV/megHBnYQZYoK4X3DfKbg7d123odC660uD4mqzutF56x2LCQZyWir8XnwZFfqkbhhoLrvzC0Au5i/e/ILKktIToVEY5ONMx6Tndy5O8NKZ0PFxv9I8JjZ2BsXU6LE8ms0DByKBEYrbTMImDP1Lno281NmsBPANYS4wP71iH3mR4zxmem72kWIgpxFYIEsXRq/OHnRrFcvWDJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gd/NjnaXxNh81P765sCdBk6OvwGARw4SD4t12/DyxQw=;
 b=ZyvS3wWe19J70ts/P63elgFhe3LB4hHIpsRk5ezjMvRdQ/NoYRD6rXDyiZsSWl55WO0J5CibrYej3B1M02JIv6wTNh8MbTViqFVhl1D7u8tV3Qoxoc86tLpjtyn+cqG02xpHPAh22el68Bq9EziRRFBs94wY1s7gq1VH+xeEzjU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: pci: fix -Wtype-limits warning in
 pci-host-common.c
Thread-Topic: [PATCH] xen/arm: pci: fix -Wtype-limits warning in
 pci-host-common.c
Thread-Index: AQHZffQTsmRRBKh80kOBQgH8fU6H2a9J0ZUAgAAT8ICAAAXxgA==
Date: Thu, 4 May 2023 10:32:21 +0000
Message-ID: <837CD804-85F2-4D3C-87FD-3F65F22A8432@arm.com>
References: <20230503191820.78322-1-stewart.hildebrand@amd.com>
 <5D298044-314C-473F-97AB-420DA3DA44A2@arm.com>
 <4ca00734-8e1e-fe5b-b2a0-6f08f3835433@xen.org>
In-Reply-To: <4ca00734-8e1e-fe5b-b2a0-6f08f3835433@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9792:EE_|AM7EUR03FT037:EE_|DB9PR08MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 04514016-2f31-4239-2b36-08db4c8adfd0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qrUfNZv1o8scGQhui2K+/8TR4e44HRQJ7inq0tysho4x0zbgVObHCZSDoUf0YnZlEHy0qruu3ssnHAt/EjZvLBLokyXLfc7JILi9UpyqFg3GzyHiHThCth0zmUv6IiyAbyN3HxEkG9zFqtC3uKr89YRpoD5tCWz8PAFVKNCYFt9Hj7Qr4ch7lJNu09409Paw6FjXyr7YR8qYMLpzMfUxV8tIthS21Fn2uhgqVNDtFViMx+m/5Xjf6NP2vaeMPxyOb+JOzB36IhAJhMbXBC7sq8gDEBSpOdv8Hs0tnQKrt+ChEbh8gj+uGuBleMv4rcj5r1sL/RjlSRmO73e5usF2f43SChx/ga442dXYUKmEKBMYDmUGl5zq3OJNUziFl3JqR1KgvEbaypmRtpDCU6vddNht2PleKHC782q7SFy4k+pMGKpHREXP+usvSEAhO3SA30OjqL6t8jZsfLRKtGDL7YTbYwdFiTGsaxvMXDiJgjUB/TnhOBYLbTiuhnqeVCSjDE/o0nwAdLvRGBMIVb5Bl7u6L6A2i9oii9Ik9aAJbN8PgXefpkX198MDPrxFq4QRDr4hnty4YyAw/7kcpMqTkXkrU7PjSa1rZiVO5jDs5XIYqLlYAkNKb2UU2hlE+sVWe6DRfa4XYTICLhTv/bEcYA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(54906003)(186003)(478600001)(6506007)(2616005)(6512007)(53546011)(71200400001)(6486002)(4326008)(6916009)(66446008)(41300700001)(66556008)(76116006)(64756008)(66476007)(91956017)(66946007)(316002)(83380400001)(5660300002)(8676002)(8936002)(122000001)(2906002)(38100700002)(38070700005)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2F448B9882E0A4E861C3689BE4D80D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9792
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5872a7cb-cf82-48f9-ab99-08db4c8ad7e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9KP2eHYCyJTyPnBv5KPTeJ3tm9/wOmsgx50RZMVZ+1dPVltKWdP56KhlxPwWfhDHuk8Q761WrYH0EFC0gAnO4gJMkWvzWOEn1MN7JJW2CQOYMsKr2PgOQ9Rw+g/AcIU+JGWmyS+MUNUlCJbKf6uUvDhYpvsSQe26m7JqJqZ0f1mxuQO+6P1BaDRjQ8iBkFqkAf522NWXfcPa7KeFNKiGe05jib8Nrcqt4BSNzNkc2qqNezk4YwI3XjBL5CajewrPagbB/qCfnsGPL1la+s9wQgCzeqgLklcxKhh2XjTMMW+qi3ehbpGFAGSHVtsYvGAaDEmfK3/JtzqFjQ+vAP+XyRcu1JVaS527sHXtkwikA6na026VZs/14W99/ATX6dewdDsTdre92PmP3SXTpBex7taS6SGn77JE0kbA2+Rfjz9mjGfb0LjWRnN1GxJof5xgstk/EDTdHiTVgQJNgGKJFyleu7Zirbg+Nze/jvwAhomCyz/1UAy5lR6ZKRGrwByQ3PfX0CPCgAYx701IBWlspA4KwnP8geDH7XSv51g7rTW7TCoiaS16A6PBZ+vEyTKQn2k1COaaqtQOCNUcdUKZ0wt9jmAvKlcAaxVJ0/utxLTqGkM2w0mDX3RMMUouD0Z5pqwQ27I47zyClvBSXgKiL01i8Pm89F08DIP9BZiF56kf6NwUwQJuTMfKEWmDoUWUZWX1J8g0Omw7m4A2sresPtmQx/XONBXUvohVFoQdFeo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(46966006)(36840700001)(40470700004)(2906002)(316002)(4326008)(8936002)(8676002)(47076005)(82310400005)(2616005)(336012)(86362001)(5660300002)(6862004)(54906003)(40460700003)(41300700001)(36756003)(70206006)(70586007)(478600001)(33656002)(6486002)(40480700001)(53546011)(6512007)(6506007)(356005)(81166007)(36860700001)(26005)(186003)(107886003)(82740400003)(34020700004)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 10:32:34.6591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04514016-2f31-4239-2b36-08db4c8adfd0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8459

SGksDQoNCj4gT24gNCBNYXkgMjAyMywgYXQgMTI6MTAsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAwNC8wNS8yMDIzIDA5OjU5LCBCZXJ0
cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgU3Rld2FydCwNCj4+PiBPbiAzIE1heSAyMDIzLCBh
dCAyMToxOCwgU3Rld2FydCBIaWxkZWJyYW5kIDxTdGV3YXJ0LkhpbGRlYnJhbmRAYW1kLmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gV2hlbiBidWlsZGluZyB3aXRoIEVYVFJBX0NGTEFHU19YRU5fQ09S
RT0iLVd0eXBlLWxpbWl0cyIsIHdlIG9ic2VydmUgdGhlDQo+Pj4gZm9sbG93aW5nIHdhcm5pbmc6
DQo+Pj4gDQo+Pj4gYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jOiBJbiBmdW5jdGlvbiDi
gJhwY2lfaG9zdF9jb21tb25fcHJvYmXigJk6DQo+Pj4gYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNv
bW1vbi5jOjIzODoyNjogd2FybmluZzogY29tcGFyaXNvbiBpcyBhbHdheXMgZmFsc2UgZHVlIHRv
IGxpbWl0ZWQgcmFuZ2Ugb2YgZGF0YSB0eXBlIFstV3R5cGUtbGltaXRzXQ0KPj4+ICAyMzggfCAg
ICAgaWYgKCBicmlkZ2UtPnNlZ21lbnQgPCAwICkNCj4+PiAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgIF4NCj4+PiANCj4+PiBUaGlzIGlzIGR1ZSB0byBicmlkZ2UtPnNlZ21lbnQgYmVp
bmcgYW4gdW5zaWduZWQgdHlwZS4gRml4IGl0IGJ5IGludHJvZHVjaW5nIGENCj4+PiBuZXcgdmFy
aWFibGUgb2Ygc2lnbmVkIHR5cGUgdG8gdXNlIGluIHRoZSBjb25kaXRpb24uDQo+Pj4gDQo+Pj4g
U2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1k
LmNvbT4NCj4+IEkgd291bGQgc2VlIHRoaXMgYXMgYSBidWcgZml4IG1vcmUgdGhhbiBhIGNvbXBp
bGVyIHdhcm5pbmcgZml4IGFzIHRoZSBlcnJvciBjb2RlIHdhcw0KPj4gaWdub3JlZCBiZWZvcmUg
dGhhdC4NCj4gDQo+ICsxLiBBbHNvIHRoZXJlIGlzIGEgbWlzc2luZyBmaXhlcyB0YWcuIEFGQUlD
VCB0aGlzIGlzc3VlIHdhcyBpbnRyb2R1Y2VkIGJ5IDZlYzkxNzZkOTRhZS4NCj4gDQo+PiBBbnl3
YXk6DQo+PiBSZXZpZXdlZC1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bh
cm0uY29tPg0KPiANCj4gSnVzdCB0byBjbGFyaWZ5LCB5b3UgYXJlIGhhcHB5IHdpdGggdGhlIGN1
cnJlbnQgY29tbWl0IG1lc3NhZ2U/IElmIHNvLCBJIGNhbiBjb21taXQgaXQgbGF0ZXIgb24gd2l0
aCB0aGUgUmV2aWV3ZWQtYnkgKyBmaXhlcyB0YWcuDQoNCldvdWxkIGJlIG5pY2UgdG8gYWRkIHRo
ZSBwcm9wZXIgZml4ZXMgZmxhZyBpZiB5b3UgY2FuIGRvIGl0IG9uIGNvbW1pdCA6LSkNCg0KQ2hl
ZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxs
DQoNCg0K

