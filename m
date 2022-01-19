Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D661649366A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 09:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258768.446046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6Sb-0000lV-2p; Wed, 19 Jan 2022 08:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258768.446046; Wed, 19 Jan 2022 08:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6Sa-0000id-VQ; Wed, 19 Jan 2022 08:36:52 +0000
Received: by outflank-mailman (input) for mailman id 258768;
 Wed, 19 Jan 2022 08:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CaTf=SD=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nA6SZ-0000h2-H6
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 08:36:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1cbaa8e-7902-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 09:36:50 +0100 (CET)
Received: from DB9PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:10:1d9::12)
 by VE1PR08MB5646.eurprd08.prod.outlook.com (2603:10a6:800:1a9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 08:36:46 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::fb) by DB9PR02CA0007.outlook.office365.com
 (2603:10a6:10:1d9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Wed, 19 Jan 2022 08:36:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 19 Jan 2022 08:36:46 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Wed, 19 Jan 2022 08:36:46 +0000
Received: from b64e53074a2c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6447A16-1F4C-4C77-9B74-99D2C6D1FCC6.1; 
 Wed, 19 Jan 2022 08:36:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b64e53074a2c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Jan 2022 08:36:39 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB7263.eurprd08.prod.outlook.com (2603:10a6:102:212::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 08:36:38 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%6]) with mapi id 15.20.4888.013; Wed, 19 Jan 2022
 08:36:38 +0000
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
X-Inumbo-ID: f1cbaa8e-7902-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asmlneFWSKypadQxTIj5OMq1etjWDUh/XoRMH1iPduE=;
 b=tPz5ITcaGrHH6x02zzY0EZP5IrSIu8Qp7rcXuS6skrYcCc/k/sVKaoTrjnGW4JPPzc7i7xTFSWiQI8ovyRZZltGwF+iVMNmJKA0iEy5nJ8IOexXgH5npI9Bl2bmv/uetUnzMP7ftMyGMX9tUnhDZG+DM0J0+HmhDVfi23DWCq+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y446pT2rkeC3Tn/Pvr6uJuUzIpoNtRToqEsgjwEt2sUYoJfLaAYdJFhaYOdy89A7Y31Ashm4uCrfcK4Vq6z3qG6Dk4pqIgJQQlGRIyNxOOBATvuGzU9zCz+8YsI0l2eoZwny23ZFdm1ludlNi3pqTDSnjVZ1sXgZgjJ39fAIMAurWozWoMMmHs8wzWQnsXAx5wsgxxv0/jj3EWjl9+fazNQHRGcIjLaFGL0a8Aqb0V298ovEuF6mpumwPBUJDClLWhcOFIcsJq1rALyVKhuip70mAX47U8wY6rBCg2surIctTgPtiZJC9xPU15gzhVmzgdiNrwwgTEKDw+4FUtRUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asmlneFWSKypadQxTIj5OMq1etjWDUh/XoRMH1iPduE=;
 b=JJO9UN87F05DDwi7lGwljEiVPj0ng+q+sgAiadfYLX9nxMWmsCqnxK9xXFfVWYr0Nc9hbqGFThuX0+HqjIzdyqOAJEEfHYSidssdxI5LluM69siFxX84BgzN5hdgbslg2XT5nT9MyUOu5Ts5uHuig4Bx0zX24VrlzhNvE9ngCnQBZwTmtt+ZTrxuwdd9ENMPGcHyLEA1RCj8lxh0ZLztFzGn3Xry3q+7NPJAq2IeejXgODObHnzxUC/hrxfmBu4/FOEqoHQ0ql37hdw5KNj6h0z6bisoMugHvFvwkfOePupzHxHsRKe+Ha2x6x3z/2heoupWphWuGtwn5bI6MHnPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asmlneFWSKypadQxTIj5OMq1etjWDUh/XoRMH1iPduE=;
 b=tPz5ITcaGrHH6x02zzY0EZP5IrSIu8Qp7rcXuS6skrYcCc/k/sVKaoTrjnGW4JPPzc7i7xTFSWiQI8ovyRZZltGwF+iVMNmJKA0iEy5nJ8IOexXgH5npI9Bl2bmv/uetUnzMP7ftMyGMX9tUnhDZG+DM0J0+HmhDVfi23DWCq+4=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 07/37] xen/x86: use paddr_t for addresses in NUMA node
 structure
Thread-Topic: [PATCH 07/37] xen/x86: use paddr_t for addresses in NUMA node
 structure
Thread-Index: AQHXsHMRNGZeupZbtEeYycYXK8HrbKxpnZqAgAD0aqCAACDcgIAACs8w
Date: Wed, 19 Jan 2022 08:36:38 +0000
Message-ID:
 <PAXPR08MB742093D8C74D8DDCB71A43069E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-8-wei.chen@arm.com>
 <a1d96556-5da4-0c73-0d87-f24758866d7d@suse.com>
 <PAXPR08MB7420654893AFC5E9941C398A9E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <f712c0b8-d539-9121-cb23-28954280b57c@suse.com>
In-Reply-To: <f712c0b8-d539-9121-cb23-28954280b57c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F69168CCDCC9B04FA3988679F2A43E9C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8d8d087e-0ef7-417d-556a-08d9db26d41e
x-ms-traffictypediagnostic:
	PAXPR08MB7263:EE_|DB5EUR03FT009:EE_|VE1PR08MB5646:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB56469B61D3A1AB3A707F514F9E599@VE1PR08MB5646.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 X9XDW3czJIhu0MXnTIDC0aWiIFnZPYpd4ODLBoDsVss+Dr21ZkhzRUcPlxLldBOakH00TIFcQHcY+yW4URRwx9nHuKJWKCp9av8Q1QWMv2jCFvNeOBhJ44CL/6xR+j5RTKpg9pgiYyxBdVuDCTq4OC2MCvtpcgN95MsOsw2OrBTQ1vrjNbt+3y+i4mEJbAZyEz8tmdB6Ocg6cB5bVbp+yot06nu9RR9XftuHgMz483d0HBQJ+XaLQkN/UuF13WUpPHwGXhdPhDuQbURVNyiGZwEMmocgKhVqk0JSXvUoHIGW68iFuOPLHLiV7kX0tejRqk3iTIbdjdwi+PvP+tP7iEz7rWc95mYpz4dyesKvpKBthEAcpWb9uIle+PtDkrSReLBuaxbgPa6XtjzOIoLFq8ZVg3Fc+vF5B1LLgy8rakoNYuAMRV9Lt9qz9R4VXgNccZyM25ar+dntrHtvrI5SIRI0BBbCkv5QyAKy6Iv7QKHqcGYTgjtdm5aN8ewWA3wKJTs1La5tb0cZuPVSY0osz9d8KwOzAiaGFgjE5Bbzcy76tpXrjrm2IopGxbEmSdkOh5yVlHaSzyqtLTzmh8dYYDwIrrWxu1fz2ZgRZIdWf8W0ItKcAthXBPNIbjMIj4KerYkD8LRP+MQEwy/xd5DDPZnwe/SY+68dMHSOkTFI00EjitH7UlfxiRmhdDGy934z8mqCI28baH4TaPcmfAk3Iw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(6916009)(186003)(8676002)(508600001)(8936002)(55016003)(9686003)(5660300002)(38070700005)(2906002)(33656002)(7696005)(86362001)(54906003)(76116006)(64756008)(71200400001)(6506007)(66556008)(66946007)(66476007)(26005)(53546011)(83380400001)(316002)(122000001)(52536014)(4326008)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7263
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0654217-d303-4aa9-53bc-08d9db26cf83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yR4BAOjm3X0eVaBoFcZ1eoqarxRrpPrr5u1Fw5RhjCVSzD81ugq4PiGTW5/pVTKzrSXPxyopcdoVDf52PMBKHqlRrAfyhk8KLuQkJiaPLpWOmjtGi9MZeT1slJuG+5sxdTTDNgcCSb/xEj6RahIErJXlU7QKnRPDSk4UoZo7L3V+6tsbjbWGlPkt5NVf6ySUrybd0Gds2jnzPabiK1+O2nZk3hohy57VDpJKmx7cb0scpDDcurhdcNzZ2IwGk+c8RJ1BAubky4H7NUCCXWHQVHeVqAZT1VBOWdxHedZkrySQGzfSG50XUGJUylAoDBcvWhpOoUdBKjFs11y4jZ035Hjpcgx4OcLVh5ZC8Vx1tdholJOLHN1gHDHcm6tcInOxu1Ymb2g4GC8ESWuC34yqSozsdPCLgCDKaTjt8TzIEzOzyLT4evcTdIqRVp7CxI3Bh1xHLCh7EZWKXd9JBnUwzjfR7Z92/D8REim7A6cag8QpHCGHt4oV1By/IRhW8XBSMqnRFg7NfaCGPy/YQA75iKtJkaBK8TT+SUyju37I5+Qr6y0RT9+qW7hIOiN2JFJ5THYL3YGHQ2GJkqhq0M32v+edJWlZXYhjmboucu4L5tj0JUVNxqa2GxzblU2BzJukleNrwtpqJeOwsfrte0AUb2tN4eFG3cBz0ohx22ffio5i3MNJJFWYgRkqnI4Wiah19KimGKRfG+bW65v08+4qBsw3loBxrFQBcPjsa/nUoozCL21hYi2RgNYQR7S4yl3G0DkvLasyytfLfdzWMpQOPw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(8676002)(70586007)(70206006)(8936002)(4326008)(336012)(81166007)(356005)(6862004)(33656002)(2906002)(54906003)(5660300002)(186003)(316002)(9686003)(52536014)(47076005)(86362001)(36860700001)(40460700001)(55016003)(82310400004)(53546011)(508600001)(6506007)(26005)(83380400001)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:36:46.3477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8d087e-0ef7-417d-556a-08d9db26d41e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5646

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgxOeaXpSAxNTo1NQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDA3LzM3XSB4ZW4veDg2OiB1c2UgcGFkZHJfdCBmb3IgYWRkcmVzc2VzIGlu
IE5VTUEgbm9kZQ0KPiBzdHJ1Y3R1cmUNCj4gDQo+IE9uIDE5LjAxLjIwMjIgMDc6MzMsIFdlaSBD
aGVuIHdyb3RlOg0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
ID4+IFNlbnQ6IDIwMjLlubQx5pyIMTjml6UgMjM6MjMNCj4gPj4NCj4gPj4gT24gMjMuMDkuMjAy
MSAxNDowMiwgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiBAQCAtMjQ5LDI0ICsyNTAsMjYgQEAgc3Rh
dGljIGludCBfX2luaXQgbnVtYV9lbXVsYXRpb24odTY0IHN0YXJ0X3BmbiwNCj4gPj4gdTY0IGVu
ZF9wZm4pDQo+ID4+PiAgdm9pZCBfX2luaXQgbnVtYV9pbml0bWVtX2luaXQodW5zaWduZWQgbG9u
ZyBzdGFydF9wZm4sIHVuc2lnbmVkIGxvbmcNCj4gPj4gZW5kX3BmbikNCj4gPj4+ICB7DQo+ID4+
PiAgICAgIGludCBpOw0KPiA+Pj4gKyAgICBwYWRkcl90IHN0YXJ0LCBlbmQ7DQo+ID4+Pg0KPiA+
Pj4gICNpZmRlZiBDT05GSUdfTlVNQV9FTVUNCj4gPj4+ICAgICAgaWYgKCBudW1hX2Zha2UgJiYg
IW51bWFfZW11bGF0aW9uKHN0YXJ0X3BmbiwgZW5kX3BmbikgKQ0KPiA+Pj4gICAgICAgICAgcmV0
dXJuOw0KPiA+Pj4gICNlbmRpZg0KPiA+Pj4NCj4gPj4+ICsgICAgc3RhcnQgPSBwZm5fdG9fcGFk
ZHIoc3RhcnRfcGZuKTsNCj4gPj4+ICsgICAgZW5kID0gcGZuX3RvX3BhZGRyKGVuZF9wZm4pOw0K
PiA+Pg0KPiA+PiBOaXQ6IFdvdWxkIGJlIHNsaWdodGx5IG5lYXRlciBpZiB0aGVzZSB3ZXJlIHRo
ZSBpbml0aWFsaXplcnMgb2YgdGhlDQo+ID4+IHZhcmlhYmxlcy4NCj4gPg0KPiA+IEJ1dCBpZiB0
aGlzIGZ1bmN0aW9uIHJldHVybnMgaW4gbnVtYV9mYWtlICYmICFudW1hX2VtdWxhdGlvbiwNCj4g
PiB3aWxsIHRoZSB0d28gcGZuX3RvX3BhZGRyIG9wZXJhdGlvbnMgYmUgd2FzdGU/DQo+IA0KPiBB
bmQgd2hhdCBoYXJtIHdvdWxkIHRoYXQgZG8/DQoNCk9rLCB0d28gb3IgdGhyZWUgaW5zdHJ1Y3Rp
b25zIHdhc3RlIGluIGluaXQgdGltZSB3aWxsIG5vdA0KdGFrZSB0b28gbXVjaCBoYXJtLiBJIHdp
bGwgbW92ZSB0aGVtIGFib3ZlIHdpdGggaW5pdGlhbGl6ZXJzLg0KDQo+IA0KPiA+Pj4gQEAgLTQ0
MSw3ICs0NDEsNyBAQCB2b2lkIF9faW5pdCBzcmF0X3BhcnNlX3JlZ2lvbnModTY0IGFkZHIpDQo+
ID4+PiAgCSAgICBhY3BpX3RhYmxlX3BhcnNlKEFDUElfU0lHX1NSQVQsIGFjcGlfcGFyc2Vfc3Jh
dCkpDQo+ID4+PiAgCQlyZXR1cm47DQo+ID4+Pg0KPiA+Pj4gLQlzcmF0X3JlZ2lvbl9tYXNrID0g
cGR4X2luaXRfbWFzayhhZGRyKTsNCj4gPj4+ICsJc3JhdF9yZWdpb25fbWFzayA9IHBkeF9pbml0
X21hc2soKHU2NClhZGRyKTsNCj4gPj4NCj4gPj4gSSBkb24ndCBzZWUgdGhlIG5lZWQgZm9yIGEg
Y2FzdCBoZXJlLg0KPiA+Pg0KPiA+DQo+ID4gY3VycmVudCBhZGRyIHR5cGUgaGFzIGJlZW4gY2hh
bmdlZCB0byBwYWRkcl90LCBidXQgcGR4X2luaXRfbWFzaw0KPiA+IGFjY2VwdCBwYXJhbWV0ZXIg
dHlwZSBpcyB1NjQuIEkga25vdyBwYWRkcl90IGlzIGEgdHlwZWRlZiBvZg0KPiA+IHU2NCBvbiBB
cm02NC8zMiwgb3IgdW5zaW5nZWQgbG9uZyBvbiB4ODYuIEluIGN1cnJlbnQgc3RhZ2UsDQo+ID4g
dGhlaXIgbWFjaGluZSBieXRlLWxlbmd0aHMgYXJlIHRoZSBzYW1lLiBCdXQgaW4gY2FzZSBvZiBm
dXR1cmUNCj4gPiBjaGFuZ2VzIEkgdGhpbmsgYW4gZXhwbGljaXQgY2FzZSBoZXJlIG1heWJlIGJl
dHRlcj8NCj4gDQo+IEl0IG1heSBvbmx5IGV2ZXIgYmUgYW4gdXAtY2FzdCwgeWV0IHRoZSBjb21w
aWxlciB3b3VsZCBkbyBhIHdpZGVuaW5nDQo+IGNvbnZlcnNpb24gKGFjY29yZGluZyB0byB0aGUg
dXN1YWwgdHlwZSBjb252ZXJzaW9uIHJ1bGVzKSBmb3IgdXMNCj4gYW55d2F5IG5vIG1hdHRlciB3
aGV0aGVyIHRoZXJlJ3MgYSBjYXN0LiBEb3duLWNhc3RzIChpbiB0aGUgZ2VuZXJhbA0KPiBjb21w
aWxlciBjYXNlLCBpLmUuIGNvbnNpZGVyaW5nIGEgd2lkZXIgc2V0IHRoYW4ganVzdCBnY2MgYW5k
IGNsYW5nKQ0KPiBzb21ldGltZXMgbmVlZCBtYWtpbmcgZXhwbGljaXQgdG8gc2lsZW5jZSBjb21w
aWxlciB3YXJuaW5ncyBhYm91dA0KPiB0cnVuY2F0aW9uLCBidXQgSSd2ZSBub3Qgb2JzZXJ2ZWQg
YW55IGNvbXBpbGVyIHdhcm5pbmcgd2hlbiB3aWRlbmluZw0KPiB2YWx1ZXMuDQoNCk9rLCBJIHdp
bGwgZHJvcCB0aGF0IGNhc3QuDQoNCj4gDQo+IEphbg0KDQo=

