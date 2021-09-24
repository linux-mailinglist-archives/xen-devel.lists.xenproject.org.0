Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CC7416958
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 03:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194719.346953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZxJ-0001ME-Sl; Fri, 24 Sep 2021 01:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194719.346953; Fri, 24 Sep 2021 01:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZxJ-0001JW-Pg; Fri, 24 Sep 2021 01:24:49 +0000
Received: by outflank-mailman (input) for mailman id 194719;
 Fri, 24 Sep 2021 01:24:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTZxH-0001JQ-OW
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 01:24:47 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51fcd975-3009-4e55-9998-58e079cc999c;
 Fri, 24 Sep 2021 01:24:45 +0000 (UTC)
Received: from AM5PR0202CA0007.eurprd02.prod.outlook.com
 (2603:10a6:203:69::17) by HE1PR0802MB2202.eurprd08.prod.outlook.com
 (2603:10a6:3:c2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Fri, 24 Sep
 2021 01:24:41 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::41) by AM5PR0202CA0007.outlook.office365.com
 (2603:10a6:203:69::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 01:24:41 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 01:24:39 +0000
Received: ("Tessian outbound 3c48586a377f:v103");
 Fri, 24 Sep 2021 01:24:37 +0000
Received: from aae5a6f8dc66.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 92C2AE0F-D581-4276-B3DE-1E2469D7BB87.1; 
 Fri, 24 Sep 2021 01:24:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aae5a6f8dc66.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 01:24:26 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB4203.eurprd08.prod.outlook.com (2603:10a6:10:ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 01:24:22 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.013; Fri, 24 Sep 2021
 01:24:22 +0000
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
X-Inumbo-ID: 51fcd975-3009-4e55-9998-58e079cc999c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZHIHgGJeRuFiAiVk5L7f10ap5pNVfmoZ7c97Z+Icns=;
 b=TmxCvEkP309xQrPPh/2Gdo9tN9gb+JLIBNMkOtzdjlU0qE6vA29Bt7Qyp7g09iou2FZuyLnsklTkrOVTrL83+P107wbs+akxAdfwnUEXkDdzrAfA0XenZM9lJyGZWlFDqqonwDGAsfSXmPRDbBfPyni32VhUIO7ViAhgt4yPW5s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmnfV+L+rjdwRqXHWNLUFWM//+3SrzLX4GW3KiH8pbowHs6pVbQRu0ndJqYkK2RqQzK7gzIkYlCF91lKRMTAe+I9hpenlt/bNEKo3P0ADF/lXu6ICtUXNruUlYz3YcsCgTVmMUCpeHDzAJd5HmMokCCsCv8/oNpd3lMFOCIu9t89WR69aKV9q9/wmvojhEUuVRMIhSbc+sBGscFU/Cg4UDcOLsYBlyjrogt81/2l5/ddBXng00TZJD/QZNQjh+NaEXsfzzomQY2FVHXctEqlBUX53iF8uD7OEuAafgEz3GoDI+IpGC7T7amO6d8H1s/nM12kZ/IETB95hWxx8VCrGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AZHIHgGJeRuFiAiVk5L7f10ap5pNVfmoZ7c97Z+Icns=;
 b=DJGyzNsnO0O1OKZmVKzCmxsUZUBqXK3lQZiKXI4xSijZFLiyGOpNYR0l7Ecm/6LeaKCXOtM93g/4/7GPNDguUrsgtXD+0Ap3TUu2kQFLHwSGeQSVj5MeD8nIOinOc+5B6oWhnYWjP+Fz6Pl6YHkuZ2qoMgGUFiG4o788387kuf6sgnUligWQ5MWGIUk1PDGmuAkOB0pttQbp9ZQ2p+MC7ipL/zdR9KYyMM4sEbjs640lrcSfOu0hRrxBik8jP5NDWjy5Rah28hIBB7tpRO+WTAMsDy46whZyiFxDIHdFIjuGfAmOGUG2Qax9dE6e2fUpevJKHKz5BEkjSrs4078y/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZHIHgGJeRuFiAiVk5L7f10ap5pNVfmoZ7c97Z+Icns=;
 b=TmxCvEkP309xQrPPh/2Gdo9tN9gb+JLIBNMkOtzdjlU0qE6vA29Bt7Qyp7g09iou2FZuyLnsklTkrOVTrL83+P107wbs+akxAdfwnUEXkDdzrAfA0XenZM9lJyGZWlFDqqonwDGAsfSXmPRDbBfPyni32VhUIO7ViAhgt4yPW5s=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 02/37] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Topic: [PATCH 02/37] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Index: AQHXsHMKuuhjNuZvvk2uWABlJOqp6quySUYAgAAbfeA=
Date: Fri, 24 Sep 2021 01:24:22 +0000
Message-ID:
 <DB9PR08MB68573AC630C8D97EFAB487E19EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-3-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231639110.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231639110.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 998BFE72FC411F41B63267CCCA11578E.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4c703b0e-c55c-4f74-c6f7-08d97efa13eb
x-ms-traffictypediagnostic: DB8PR08MB4203:|HE1PR0802MB2202:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB22026F5A25B2925055E5FC349EA49@HE1PR0802MB2202.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6i0Ed15mUWeHGcQClg/p3ZzkUFXWhzFNt/dNFDZeWGQe+D4AIjZ++hSGC/eHOVpsjIUUFRJVEnEdz5Hhk5q/oREPA0Sjep+HLum+ejM/CxvpSKEma90PSpX/I/WyVBA3QpG27GTf2apv1psDpJe4m+xgUHJjbG76ndGL+Hq8484PAnR59RmupJYr/X1mCk2ZrTRJr6/zERi0ongN5zaC1qXHAE27NUvCc+2lKUV3yv29ZDBGwksojH2sheR0zgxgWsZyQ9zeOTxqdjorn3u2lPfYi7mh9DSQRXbGNbJgGOpbAkoowmwVx0nhhyoUMMEWzr2SjL+lHZVZVfuv1blhFA4KM5I28evE3cmI8q05ErwC4MoY5QA/cNgnPYpNimOpUzFUrGc8Fma8fay7PfAlynbznaaqbP7+BXIbawHgOekNIy4j4Ff20Zr/MIRDVCazD6heXrJArz3uAG3N6g7NR7eTf1ja3beFBH+4vXkQSs9/qzA5vco/++leEn2gSpxX4pzAl52SLoQ07KgD+VHIaMcgGJQvhRv+cTJN8zt7dcf5C77Xz/OUBuc+ZfRiBx6hFxp9YUqRfmpQfCjX2TEAzAZbWpG0A8BTj914EaLYAHWeHwy4eLqtAdT1KFM6HpdyDP7t3hZUN5wsxLHabTzLj/RIXlS7Iuw6Gij+G9iU7RF3O0n9phd2JvX3MITQNAKeus1wia/JGBJI4p3+bn1K2g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6916009)(186003)(71200400001)(66946007)(9686003)(38100700002)(316002)(66446008)(4326008)(33656002)(64756008)(66556008)(8936002)(66476007)(2906002)(26005)(38070700005)(55016002)(86362001)(7696005)(52536014)(53546011)(83380400001)(122000001)(54906003)(5660300002)(76116006)(6506007)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4203
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	892debf5-97e7-47c6-1985-08d97efa0a0d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CD72RJy/DfA/TbMkw99PnLT4kq2Xof3rlnGOpLx6J64HCoKkg5j79pcwPHoVY7VFKapCI038TMR27qp6VnicEMwsSANKBIP72vRMpGzzo4KfFxE6+xBMpj5FfzbddxtQkBUatPE/1cILUek4rbDAhl35dpoQEJWxyJIEKmofJD45nODX5tKe68zBNRd5jUnKe+RVytlqc1weU54abtsgqy+3ulYXQsypzxzmt7TAgDVNMU3+dALbZ7F/ayXUJG+GhjYdUQFKqbg4K+nWFhUJBm8S1/QRAhLQqWXkrs4j2u70Nv3mU6iz67buo7LUpPEpcpHxIq8Ms5DoMQvnf4TsH2e+1S83Sx49N7/3iaFlP8yek4+xMA++QQXBN87rMu+uSRXexAQaAuMK2QYXDcHbRxFfTfGMRrpqjFMB34JKBf7SDHEsYvn91R9v6hnbGCHW3a4qiTHo+KMCuuagQEDJYGgZI9Fuuc471eUHe75kA1yqSRL1oLLGTfjRBd04b46DwSxGPOFjxlTlzaJr9ELY1a6+1ccfCmw7308kD3hdB15A4KT3n+m2xpiWElcdldHuPYQP69pqDBrLzvu3q4sbUjflZDXFs0yT19cN8P4+hbpHIYNgrzlA0pAJxHqdc0avZA8qRGUpdOcNh13VSIj+q8hDyc0Ep8fMp4HFnKIJ18su2nSSClUAiWgJQTjywnazDivsjCjzfwKc9IQpU/BzUg==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2906002)(83380400001)(7696005)(55016002)(33656002)(86362001)(26005)(508600001)(336012)(186003)(6506007)(53546011)(9686003)(36860700001)(47076005)(5660300002)(356005)(54906003)(70206006)(8676002)(8936002)(70586007)(4326008)(52536014)(316002)(81166007)(82310400003)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 01:24:39.0188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c703b0e-c55c-4f74-c6f7-08d97efa13eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2202

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgNzo0NQ0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDIvMzddIHhlbjogaW50cm9kdWNlIGEgS2NvbmZpZyBv
cHRpb24gdG8gY29uZmlndXJlDQo+IE5VTUEgbm9kZXMgbnVtYmVyDQo+IA0KPiBPbiBUaHUsIDIz
IFNlcCAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBDdXJyZW50IE5VTUEgbm9kZXMgbnVtYmVy
IGlzIGEgaGFyZGNvZGUgY29uZmlndXJhdGlvbi4gVGhpcw0KPiA+IGNvbmZpZ3VyYXRpb24gaXMg
ZGlmZmljdWx0IGZvciBhbiBhZG1pbmlzdHJhdG9yIHRvIGNoYW5nZQ0KPiA+IHVubGVzcyBjaGFu
Z2luZyB0aGUgY29kZS4NCj4gPg0KPiA+IFNvIGluIHRoaXMgcGF0Y2gsIHdlIGludHJvZHVjZSB0
aGlzIG5ldyBLY29uZmlnIG9wdGlvbiBmb3INCj4gPiBhZG1pbmlzdHJhdG9ycyB0byBjaGFuZ2Ug
TlVNQSBub2RlcyBudW1iZXIgY29udmVuaWVudGx5Lg0KPiA+IEFsc28gY29uc2lkZXJpbmcgdGhh
dCBub3QgYWxsIGFyY2hpdGVjdHVyZXMgc3VwcG9ydCBOVU1BLA0KPiA+IHRoaXMgS2NvbmZpZyBv
cHRpb24gb25seSBjYW4gYmUgdmlzaWJsZSBvbiBOVU1BIGVuYWJsZWQNCj4gPiBhcmNoaXRlY3R1
cmVzLiBOb24tTlVNQSBzdXBwb3J0ZWQgYXJjaGl0ZWN0dXJlcyBjYW4gc3RpbGwNCj4gPiB1c2Ug
MSBhcyBNQVhfTlVNTk9ERVMuDQo+IA0KPiBUaGlzIGlzIE9LIGJ1dCBJIHRoaW5rIHlvdSBzaG91
bGQgYWxzbyBtZW50aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZQ0KPiB0aGF0IHlvdSBhcmUgdGFr
aW5nIHRoZSBvcHBvcnR1bml0eSB0byByZW1vdmUgTk9ERVNfU0hJRlQgYmVjYXVzZSBpdCBpcw0K
PiBjdXJyZW50bHkgdW51c2VkLg0KPiANCj4gV2l0aCB0aGF0Og0KPiANCj4gUmV2aWV3ZWQtYnk6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gDQo+IA0KDQpU
aGFua3MsIEkgd2lsbCB1cGRhdGUgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gU2lnbmVkLW9m
Zi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNo
L0tjb25maWcgICAgICAgICAgIHwgMTEgKysrKysrKysrKysNCj4gPiAgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9udW1hLmggfCAgMiAtLQ0KPiA+ICB4ZW4vaW5jbHVkZS94ZW4vbnVtYS5oICAgICB8IDEw
ICsrKysrLS0tLS0NCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL0tjb25maWcgYi94ZW4v
YXJjaC9LY29uZmlnDQo+ID4gaW5kZXggZjE2ZWIwZGY0My4uOGEyMGRhNjdlZCAxMDA2NDQNCj4g
PiAtLS0gYS94ZW4vYXJjaC9LY29uZmlnDQo+ID4gKysrIGIveGVuL2FyY2gvS2NvbmZpZw0KPiA+
IEBAIC0xNywzICsxNywxNCBAQCBjb25maWcgTlJfQ1BVUw0KPiA+ICAJICBGb3IgQ1BVIGNvcmVz
IHdoaWNoIHN1cHBvcnQgU2ltdWx0YW5lb3VzIE11bHRpLVRocmVhZGluZyBvcg0KPiBzaW1pbGFy
DQo+ID4gIAkgIHRlY2hub2xvZ2llcywgdGhpcyB0aGUgbnVtYmVyIG9mIGxvZ2ljYWwgdGhyZWFk
cyB3aGljaCBYZW4gd2lsbA0KPiA+ICAJICBzdXBwb3J0Lg0KPiA+ICsNCj4gPiArY29uZmlnIE5S
X05VTUFfTk9ERVMNCj4gPiArCWludCAiTWF4aW11bSBudW1iZXIgb2YgTlVNQSBub2RlcyBzdXBw
b3J0ZWQiDQo+ID4gKwlyYW5nZSAxIDQwOTUNCj4gPiArCWRlZmF1bHQgIjY0Ig0KPiA+ICsJZGVw
ZW5kcyBvbiBOVU1BDQo+ID4gKwloZWxwDQo+ID4gKwkgIENvbnRyb2xzIHRoZSBidWlsZC10aW1l
IHNpemUgb2YgdmFyaW91cyBhcnJheXMgYW5kIGJpdG1hcHMNCj4gPiArCSAgYXNzb2NpYXRlZCB3
aXRoIG11bHRpcGxlLW5vZGVzIG1hbmFnZW1lbnQuIEl0IGlzIHRoZSB1cHBlciBib3VuZA0KPiBv
Zg0KPiA+ICsJICB0aGUgbnVtYmVyIG9mIE5VTUEgbm9kZXMgdGhlIHNjaGVkdWxlciwgbWVtb3J5
IGFsbG9jYXRpb24gYW5kDQo+IG90aGVyDQo+ID4gKwkgIE5VTUEtYXdhcmUgY29tcG9uZW50cyBj
YW4gaGFuZGxlLg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L251bWEuaCBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvbnVtYS5oDQo+ID4gaW5kZXggYmFkYTJjMGJiOS4uM2NmMjZj
MmRlZiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L251bWEuaA0KPiA+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbnVtYS5oDQo+ID4gQEAgLTMsOCArMyw2IEBADQo+ID4N
Cj4gPiAgI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+DQo+ID4NCj4gPiAtI2RlZmluZSBOT0RFU19T
SElGVCA2DQo+ID4gLQ0KPiA+ICB0eXBlZGVmIHU4IG5vZGVpZF90Ow0KPiA+DQo+ID4gIGV4dGVy
biBpbnQgc3JhdF9yZXY7DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+ID4gaW5kZXggN2FlZjFhODhkYy4uNTI5NTBhMzE1
MCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+ID4gKysrIGIveGVu
L2luY2x1ZGUveGVuL251bWEuaA0KPiA+IEBAIC0zLDE0ICszLDE0IEBADQo+ID4NCj4gPiAgI2lu
Y2x1ZGUgPGFzbS9udW1hLmg+DQo+ID4NCj4gPiAtI2lmbmRlZiBOT0RFU19TSElGVA0KPiA+IC0j
ZGVmaW5lIE5PREVTX1NISUZUICAgICAwDQo+ID4gLSNlbmRpZg0KPiA+IC0NCj4gPiAgI2RlZmlu
ZSBOVU1BX05PX05PREUgICAgIDB4RkYNCj4gPiAgI2RlZmluZSBOVU1BX05PX0RJU1RBTkNFIDB4
RkYNCj4gPg0KPiA+IC0jZGVmaW5lIE1BWF9OVU1OT0RFUyAgICAoMSA8PCBOT0RFU19TSElGVCkN
Cj4gPiArI2lmZGVmIENPTkZJR19OUl9OVU1BX05PREVTDQo+ID4gKyNkZWZpbmUgTUFYX05VTU5P
REVTIENPTkZJR19OUl9OVU1BX05PREVTDQo+ID4gKyNlbHNlDQo+ID4gKyNkZWZpbmUgTUFYX05V
TU5PREVTICAgIDENCj4gPiArI2VuZGlmDQo+ID4NCj4gPiAgI2RlZmluZSB2Y3B1X3RvX25vZGUo
dikgKGNwdV90b19ub2RlKCh2KS0+cHJvY2Vzc29yKSkNCj4gPg0KPiA+IC0tDQo+ID4gMi4yNS4x
DQo+ID4NCg==

