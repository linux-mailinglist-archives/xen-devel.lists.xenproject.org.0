Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ABB7AA68A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 03:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606677.944676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjV1F-0007Xq-KD; Fri, 22 Sep 2023 01:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606677.944676; Fri, 22 Sep 2023 01:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjV1F-0007Wu-G0; Fri, 22 Sep 2023 01:31:45 +0000
Received: by outflank-mailman (input) for mailman id 606677;
 Fri, 22 Sep 2023 01:31:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aXRy=FG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qjV1E-0007Wi-D9
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 01:31:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c82afa56-58e7-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 03:31:41 +0200 (CEST)
Received: from AS9PR06CA0550.eurprd06.prod.outlook.com (2603:10a6:20b:485::11)
 by DBBPR08MB6156.eurprd08.prod.outlook.com (2603:10a6:10:20b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 01:31:12 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:485:cafe::1b) by AS9PR06CA0550.outlook.office365.com
 (2603:10a6:20b:485::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.32 via Frontend
 Transport; Fri, 22 Sep 2023 01:31:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20 via Frontend Transport; Fri, 22 Sep 2023 01:31:12 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Fri, 22 Sep 2023 01:31:11 +0000
Received: from 4bfd500c382b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D66B5454-8001-4053-8A40-D6770997ADA6.1; 
 Fri, 22 Sep 2023 01:31:05 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4bfd500c382b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Sep 2023 01:31:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB5328.eurprd08.prod.outlook.com (2603:10a6:803:13a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 22 Sep
 2023 01:31:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 01:31:03 +0000
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
X-Inumbo-ID: c82afa56-58e7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeO28K0ZBDxilTzshX43k428o5Wi/4fmScCfSOk6Phw=;
 b=SnNjHIwuGEbxVcYuJOxr37b6q5oc6INkWbfMhzHAH3Gf6Atdi4ELthIK8JBTMGZ5Q8qiQlj91oEWt+dQrFTd2vytRVOvEVbAAVBkseqgsB4QSTprk0vOYQz83gxyUlzLmNiI8ZM8JVh5UgLs9w+Qpm2f8X/+ZrGLVE3/EvO7fTA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3700a2949b093e7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNcZnbxLpOZ/tpMlZTSHAo03f34RuFUlYVKp/osNGwSxhZ2MfxX0LBAUOr8T23CfEf4N3YjeoK/rcdcwCdTkwcpgTMl6ms0ZrDbKkjrGj8w4u7WT24dANtxHrHf/oyBA1tdGCNSMr8uI9zFPimMxu/kiIDo7ePe6g3nnm7Wb5dbsFvVV1NETVnqIqr/dTQ0QwRm32nZIPtN1fz8XQPA9wPL2OmfKiEi8ISnGSxo84QrtxJS+a8Yi3NN9Ta1OkV4j/09A0aLkPI9UZj3n7tVrRMMxCc4nSPQ6IdaHbtdV6Yxg5eT0ReEfNOqNWZBMFseUx+W2dWUAjdFOMCxGqRXx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeO28K0ZBDxilTzshX43k428o5Wi/4fmScCfSOk6Phw=;
 b=MWtpvqbb3/2zpmKSIvXFHBRnANK4S//2PBauf2rKQ8ye3fk4G8+TRLfJ3wqYh4FM1YJ3VaaaFNx1HTRZfGP1Z9IyAYAs/L8qWls9Wj6GLYw/RS/O2gZ/y3UtYYmHXs3Y0Cu5ftiGKX4Mb3cQ3x12Ov8uOoGmSH+D4JtO3FoYBfUrflK/XVCXkIACP7w8xXBLtWJ1d57NYesf1pM8WefsQ6ltObQpyGnNuiPDQ+BBLS6h4zdYbxD4fkut/sLndEZwUfhbfZX20ozLyf+i190ufA85tvE1IhNUZPfsvdgIWnIGwQwJgfA7gudijhVa7ZgxAEJ03JRCMPn1UcGL9jz0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeO28K0ZBDxilTzshX43k428o5Wi/4fmScCfSOk6Phw=;
 b=SnNjHIwuGEbxVcYuJOxr37b6q5oc6INkWbfMhzHAH3Gf6Atdi4ELthIK8JBTMGZ5Q8qiQlj91oEWt+dQrFTd2vytRVOvEVbAAVBkseqgsB4QSTprk0vOYQz83gxyUlzLmNiI8ZM8JVh5UgLs9w+Qpm2f8X/+ZrGLVE3/EvO7fTA=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/paging: Delete update_cr3()'s do_locking parameter
Thread-Topic: [PATCH] x86/paging: Delete update_cr3()'s do_locking parameter
Thread-Index: AQHZ6/fUOR6sHl/nsk2xhF9PyzBzTLAlOT2AgADXrAA=
Date: Fri, 22 Sep 2023 01:31:03 +0000
Message-ID: <2DC52974-F6BB-479B-8A1D-3E57CCA1897C@arm.com>
References: <20230920192153.1967618-1-andrew.cooper3@citrix.com>
 <0ba4e387-5f58-6828-9168-cab0ae3b3698@suse.com>
In-Reply-To: <0ba4e387-5f58-6828-9168-cab0ae3b3698@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB5328:EE_|AM7EUR03FT051:EE_|DBBPR08MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 5589c1d8-5d3d-4b7d-56c3-08dbbb0b9b16
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TL7nEBcRql/UZR+LW4ta+wdtaOJjtWDZ5gmOKARr8nBRWd1GdfSfXc+YGHLp+s29PEOhYPIoAaDCsDw6jHZWQWbQ1VFYJAsQkCBj2sq1eWmCKhMzzebYD4uHTRTWFFARxX2NxKU+sX4i6POiERyvW1g0/mn9dZS8ojcFlGG4XlL+QZohtl3PcvBHMt609mZb6EtHEQjBQsjmrSE4V3sfpvZMBqfsNQ2cbwh1WCj1Ecod0lTX8ow5Uv/U7TXRVUxIJPrD42cWzAq2VVcdklrPK3gNtRBkURH6hGVVnqkQYtNUAXLO+t6jxugeXF71SN0XVbrVm1BAIuGWPUq9WzHfTG9QQ7pq6avReqOtDTybscZnli9iFt0+NxAv1xQefXz48yHeIA3ju/j4HIZgoPuzSIq1TFteB5ESmlwrd0RGyKU/6S5j2x3HnpzqDXXqUkuFtBTU3ccyuNv+n5nNiD7shq3ueyDljgia/Z+bPrCwlzwmh4iK+vuFsg+V6FBfZuv2bOrzlMYw1R2fJxCQOs0b0Nfy90/ZFwnDb5c7BbI2RIOhmjGvNaAEVEDb0ffXycJ+SLL0K+mNah2QRC3P7tlI9BQsYO49cDip1/gz0vd9Dno9GKIBM1GeRjjOB0OXkrafJKqIXz1KtnyBmBpdA0I2Cg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(2906002)(316002)(5660300002)(54906003)(76116006)(26005)(41300700001)(6916009)(66556008)(91956017)(66446008)(66946007)(64756008)(66476007)(478600001)(4326008)(8936002)(8676002)(71200400001)(6486002)(6506007)(53546011)(6512007)(38100700002)(2616005)(86362001)(36756003)(33656002)(122000001)(83380400001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FA9B65EE485EE4AB6344FAD3F942C2F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5328
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba09e1d7-bb69-4de0-2242-08dbbb0b959c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hu0hM4Y1nBlTea1kNjmDv4WqKft3bx3NU32NHpr/BNA53ChES7NgZLbiOgARj4luOCRj3nHJl3UZJKBPO7Z5pVPKsriPRZBev0vcqPzcmvA4hPWWtFynr95yxxUuJAOWUw5W3/xf4Ii0cmOnvqpxU1LQt3mk923ZF+wWifW4ef99asMOL8IOmAh8jirkuiP/99bjzn0OIT57lDglahlTh8Jtb+AGt137EiKx7VWeBuahT3YETfy0VxcMymomrU3QVoeVpjGMkhS+aZMs12SXqcU1aP4B+QHKUnO91ZJv7MHCdk178ugkHIiAt2JbhpPev3Os+mUHd1X3PwVTTAda+YX3HzHCxeZ/fVAE6G86eTIZJ1eOvdwBNlvy77pJUFk0TmngqYakU8QN9pdwxQj5fc/Js8/ARf4lUEPPh8MREEZxV5JhlNDjUSvRIZgox6BGA/GDaQF7zaewUowamU0yk9etPwyOXwyawGQuho/ZZFcosKG2B1PfHdDh0zH5RUHObRInov6hsBLlvBhDmp4GWc2SyFnnUaF9ilqYESeKmROGXbE5boxgBWWQs7Xb90OLunTpeGc1+S2WSf3+7j4U+Bq78T8qxgQExnj4hyOI/cWg69i/w3tzH9THD8kyXT4SCQhjepyv8M/2l24qqqf/P8NLZkVXp4VV6nZ+uQNo1b1yq/fbImBQut5nOAP9Yw3TvFECv4jMxu1nksvFTeV6vdK751hexMtJSi9qS75EorRHErOkLo16D1Uwh/OGMu87PhOGvPG0xJpiB7vKiR+Mww==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230921699003)(451199024)(186009)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(40460700003)(6862004)(5660300002)(2906002)(4326008)(41300700001)(8676002)(8936002)(70586007)(316002)(33656002)(40480700001)(54906003)(86362001)(36756003)(70206006)(26005)(336012)(83380400001)(6512007)(2616005)(53546011)(36860700001)(356005)(47076005)(6486002)(6506007)(478600001)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 01:31:12.3399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5589c1d8-5d3d-4b7d-56c3-08dbbb0b9b16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6156

SGksDQoNCj4gT24gU2VwIDIxLCAyMDIzLCBhdCAyMDozOCwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gT24gMjAuMDkuMjAyMyAyMToyMSwgQW5kcmV3IENvb3BlciB3
cm90ZToNCj4+IE5pY29sYSByZXBvcnRzIHRoYXQgdGhlIFhTQS00MzggZml4IGludHJvZHVjZWQg
bmV3IE1JU1JBIHZpb2xhdGlvbnMgYmVjYXVzZSBvZg0KPj4gc29tZSBpbmNpZGVudGFsIHRpZHlp
bmcgaXQgdHJpZWQgdG8gZG8uICBUaGUgcGFyYW1ldGVyIGlzIHVzZWxlc3MsIHNvIHJlc29sdmUN
Cj4+IHRoZSBNSVNSQSByZWdyZXNzaW9uIGJ5IHJlbW92aW5nIGl0Lg0KPj4gDQo+PiBoYXBfdXBk
YXRlX2NyMygpIGRpc2NhcmRzIHRoZSBwYXJhbWV0ZXIgZW50aXJlbHksIHdoaWxlIHNoX3VwZGF0
ZV9jcjMoKSB1c2VzDQo+PiBpdCB0byBkaXN0aW5ndWlzaCBpbnRlcm5hbCBhbmQgZXh0ZXJuYWwg
Y2FsbGVycyBhbmQgdGhlcmVmb3JlIHdoZXRoZXIgdGhlDQo+PiBwYWdpbmcgbG9jayBzaG91bGQg
YmUgdGFrZW4uDQo+PiANCj4+IEhvd2V2ZXIsIHdlIGhhdmUgcGFnaW5nX2xvY2tfcmVjdXJzaXZl
KCkgZm9yIHRoaXMgcHVycG9zZSwgd2hpY2ggYWxzbyBhdm9pZHMNCj4+IHRoZSBhYmlsaXR5IGZv
ciB0aGUgc2hhZG93IGludGVybmFsIGNhbGxlcnMgdG8gYWNjaWRlbnRhbGx5IG5vdCBob2xkIHRo
ZSBsb2NrLg0KPj4gDQo+PiBGaXhlczogZmIwZmY0OWZlOWY3ICgieDg2L3NoYWRvdzogZGVmZXIg
cmVsZWFzaW5nIG9mIFBWJ3MgdG9wLWxldmVsIHNoYWRvdyByZWZlcmVuY2UiKQ0KPj4gUmVwb3J0
ZWQtYnk6IE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+
PiAtLS0NCj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+PiBDQzogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiBDQzogV2VpIExpdSA8d2xA
eGVuLm9yZz4NCj4+IENDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5j
b20+DQo+PiBDQzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+DQo+PiBDQzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4gQ0M6IE5pY29sYSBWZXRyaW5pIDxu
aWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4+IA0KPj4gU2xpZ2h0bHkgUkZDLiAgT25seSBj
b21waWxlIHRlc3RlZCBzbyBmYXIuDQo+IA0KPiBXaXRoIHNoYWRvdy9ub25lLmMgYWxzbyBzdWl0
YWJseSBlZGl0ZWQNCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ==

