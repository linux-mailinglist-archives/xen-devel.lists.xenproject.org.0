Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3FF70B7E0
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 10:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537813.837346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q118n-0006ZE-J0; Mon, 22 May 2023 08:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537813.837346; Mon, 22 May 2023 08:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q118n-0006Vz-GA; Mon, 22 May 2023 08:43:41 +0000
Received: by outflank-mailman (input) for mailman id 537813;
 Mon, 22 May 2023 08:43:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvIk=BL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q118l-0006Vt-Ow
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 08:43:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bea83b16-f87c-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 10:43:37 +0200 (CEST)
Received: from AM5PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::26) by DB4PR08MB8029.eurprd08.prod.outlook.com
 (2603:10a6:10:38b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 08:43:34 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::b5) by AM5PR0602CA0016.outlook.office365.com
 (2603:10a6:203:a3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27 via Frontend
 Transport; Mon, 22 May 2023 08:43:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Mon, 22 May 2023 08:43:33 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Mon, 22 May 2023 08:43:33 +0000
Received: from 8f980bf7ee3a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1361FCBB-310F-4C27-9035-60464F8224DE.1; 
 Mon, 22 May 2023 08:43:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f980bf7ee3a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 May 2023 08:43:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB6496.eurprd08.prod.outlook.com (2603:10a6:102:df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 08:43:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 08:43:21 +0000
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
X-Inumbo-ID: bea83b16-f87c-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OP3O84fWw+UIaHgJZT4TtNGIMglRSNnttqHAAL06ogc=;
 b=4y/+TRw2gBBMBlU9OxTrAl7x3+uspOvFSecZujx43c4rYzV2Kt0QlZHwAmPekmt63yf1xMFhq3dyCpHD6mJ8z6FOwpShEUwVlSPfFV/0creMRsWsPjbbU+C5HdxKLh0y9UUPBTjdM4fA84XlYcWwZWjECy7xijiRiH+2864fcNw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 55640785665b7a54
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvPGhUXYL1HE85H92fl73RGvEz8huuCo05B7Ynb9V1urky+Fxc+kpiz4tDae0Qm4JJs8xlfeoOIOaxNwgKuKdy3obrcxyk0GJ7z+UBDjY3U8xGFmHUbNvLsjCPI4M5m6mZThap9kJWBdTNlFxHx6N3CGDB2rsd8INKiWNyoHGeOVdUGusw6hTKxfje7w/biuzZp6PCkntaBZD9J8egtCW2SwyqY/BMqmgII0kQ2EgLEAPGWWqDFZXOCqopHFV8BKMnruYi86cNDrBMOhgPf9Wk+La0dk8xDBwkVmeMHvg8AzIAnP/j5hN9avrfnz/pIM17kCJt5h4OtTaqDPGAea+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OP3O84fWw+UIaHgJZT4TtNGIMglRSNnttqHAAL06ogc=;
 b=DoCtHBCfV6UiKjKbgccRkKF0OfC7PPaf2dG3AufE11Grjc4Vt1jYP6LueEnXvhWFdSk2tWyLnkNaaCUWqCW8ByrdtZR61MD/Sxj4hEroP8H5FctulWD7MRLYR+iSQ00fBzeQvfOKMx7dyd5VhJjnB+9ah8iTBQAGCLvbVCD3X95j1gVL+/I2XoJRHPqXjpnVdei6uk9R6MFlRbP73SXGg9UtqTRxfgN/oEcTG2G3pYySYKrUxS7ZieHB2v86BtYFset9NjhnxrqMZsdFIV5OebYj0nUi/hyJWgj4e/sm7SQgJlqlndWzb37wgDQUw+2ZcHyUCTKmB7wSXSypDow3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OP3O84fWw+UIaHgJZT4TtNGIMglRSNnttqHAAL06ogc=;
 b=4y/+TRw2gBBMBlU9OxTrAl7x3+uspOvFSecZujx43c4rYzV2Kt0QlZHwAmPekmt63yf1xMFhq3dyCpHD6mJ8z6FOwpShEUwVlSPfFV/0creMRsWsPjbbU+C5HdxKLh0y9UUPBTjdM4fA84XlYcWwZWjECy7xijiRiH+2864fcNw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Thread-Topic: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Thread-Index: AQHZdnKBJmFHv6Wq8kSjvXctD+zlI69f6zCAgAHjioCAAAXEgIAEQtyAgAAOngA=
Date: Mon, 22 May 2023 08:43:21 +0000
Message-ID: <8A5D1D62-0FCF-4A2F-8B09-D216002D168C@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-2-luca.fancellu@arm.com>
 <1fb3c4a2-8bc7-45e4-7ccf-803157f1b3b1@xen.org>
 <86D7B5C8-2671-4359-A48D-E7D52B06565C@arm.com>
 <2f14dad9-25f5-7ac7-4ff5-d756e6f55718@xen.org>
 <a21f2917-052a-ddb5-3de5-1ea58cb55252@suse.com>
In-Reply-To: <a21f2917-052a-ddb5-3de5-1ea58cb55252@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB6496:EE_|AM7EUR03FT052:EE_|DB4PR08MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fa53d8-942b-41fd-24d0-08db5aa0a093
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pdpan5DwXJu7pmuyJi0aRxq1wY9PP+R+slpIOLu4PMorhJEJ0PwJGfcpbPkEoFKbfHaQzPSDysgw4UhMoFH5Ji96TdQFyRPV4TndNBLRDOq6tOEBm5JmMxnkPGIOamEnU0VYJbmd48OhBeHVgkS49ACT6uDstUAZuTAFuRfdyMttbQc0q36YDe/WUjBrTQC1/RQ1oG8MzOwa2wGadfSQnT0yVEPAG01pQz8sT4xJMN50UZZfICFUla9x841svVPuXdtiU43Pp6zIfVnTJ26ir35oB1RDTMjEZ0sM+H6A6PMk7q49CvMG/1eyl2buXIm/jinn3evAOdFmYzv15SEtxZSyYUFdHhCR/G2l45718u/ysxbjZ37FnI3ywIYwVz/QCYaA+TdmwRAc+TMuYGd9hnb38z3kkKUsE3L41kVFQ14DYi+denrlbGWlnWEJtmLQ1KvVm8Lczfzk3elQ07qJU7f2AXX6OnTCMbHmzAfYv2kLmbfyVFCNUuBPwYmtSuWbhFavkuA1mmGEVAfUARj4PJhlAst8u31jfJZPdk2IOQ08pbK+gDYxxEJELCjteX5CWPEAUn025gptO+QF6joj+HHg4+5nYe1UHAECT/VyaBmsfZo9tOmislUKCGiRPTjGnChsUSGd6rNbie+fryfSuA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(122000001)(38100700002)(8676002)(8936002)(38070700005)(5660300002)(53546011)(6512007)(6506007)(26005)(186003)(2906002)(2616005)(36756003)(83380400001)(33656002)(86362001)(71200400001)(54906003)(316002)(478600001)(4326008)(66556008)(66476007)(66446008)(64756008)(6916009)(66946007)(91956017)(76116006)(41300700001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <861D923A732B9D419094B9EBBA033C7C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6496
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f1a590b-44d2-4c6f-f482-08db5aa09926
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ni3/uLuAC8jKW/9747jHjbVGi4In0/NWOQZS3wWnUoCSnnDk0LBMrAL33+9nFHJZ2dVK1jbnmm163EVt/NYEN0I2HNN0+DdXdc03o+dMCWQEr4bpao+Dess7F3jHTLea/R0WqT8QzHeu3wXj0haaefXi7lvS/L4eFm/H/Qe30k9u0TfIk2tipcqfeJa4hUUz1D/lAMf3ZIuASbVNwVQr/KpRCVDmJ82G9ws6EOgwNGGePwRcn/xmwqLIWxBSQvOT06cYYOtgS7e0qX/RjuJoTC/yLUXMrlLCTLpPbvOKgTOyXi3FisTzscS8mf1GBU9yTSPDTtF0vLJn7cPh2nz2dRsrcrgSndMqsMwnWjJafHjgSqiUgeT0ux1EUC9ACOQttjp5mHorZYibiReStOlZO6ZyezjCfC2sfU/JciOsS9+d8h3kjkwYnLRr3eeHZWt44pBrjmtbRwkaKBFz2/bmEWLDxOKdyXW/GMLejlgo2LaEKRvkeaj8mcpqAPIoa5a95adj8pnrwEDT80EQR7/mG/nXHJra67ACvIMEGLiGoHdCSjD1r2HTXvNrIx5gAT/RLKN+HCZ4QqTDjTZdel7MLkA5YpBV2JPJQYnnYIQKeKFflOBR6fh7URbYIkBB5F7SORI81xE7IY/eTHml7xVJb6/EiWlWuhve1MCXXuiJZylibujNekRUhrRupRCJwZBLuSpnnHNCsr60LqXHqqFRyA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(136003)(346002)(376002)(451199021)(36840700001)(46966006)(6862004)(8676002)(8936002)(5660300002)(36860700001)(47076005)(82310400005)(186003)(26005)(53546011)(6512007)(6506007)(336012)(83380400001)(86362001)(2616005)(81166007)(356005)(82740400003)(107886003)(41300700001)(6486002)(40480700001)(33656002)(70206006)(70586007)(316002)(36756003)(4326008)(478600001)(54906003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 08:43:33.7853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fa53d8-942b-41fd-24d0-08db5aa0a093
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8029

DQoNCj4gT24gMjIgTWF5IDIwMjMsIGF0IDA4OjUwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTkuMDUuMjAyMyAxNjo0NiwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPj4gT24gMTkvMDUvMjAyMyAxNToyNiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4g
T24gMTggTWF5IDIwMjMsIGF0IDEwOjM1LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3
cm90ZToNCj4+Pj4+ICsvKg0KPj4+Pj4gKyAqIEFybSBTVkUgZmVhdHVyZSBjb2RlDQo+Pj4+PiAr
ICoNCj4+Pj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIgQVJNIEx0ZC4NCj4+Pj4+ICsgKi8NCj4+
Pj4+ICsNCj4+Pj4+ICsjaW5jbHVkZSA8eGVuL3R5cGVzLmg+DQo+Pj4+PiArI2luY2x1ZGUgPGFz
bS9hcm02NC9zdmUuaD4NCj4+Pj4+ICsjaW5jbHVkZSA8YXNtL2FybTY0L3N5c3JlZ3MuaD4NCj4+
Pj4+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPg0KPj4+Pj4gKyNpbmNsdWRlIDxhc20vc3lz
dGVtLmg+DQo+Pj4+PiArDQo+Pj4+PiArZXh0ZXJuIHVuc2lnbmVkIGludCBzdmVfZ2V0X2h3X3Zs
KHZvaWQpOw0KPj4+Pj4gKw0KPj4+Pj4gK3JlZ2lzdGVyX3QgY29tcHV0ZV9tYXhfemNyKHZvaWQp
DQo+Pj4+PiArew0KPj4+Pj4gKyAgICByZWdpc3Rlcl90IGNwdHJfYml0cyA9IGdldF9kZWZhdWx0
X2NwdHJfZmxhZ3MoKTsNCj4+Pj4+ICsgICAgcmVnaXN0ZXJfdCB6Y3IgPSB2bF90b196Y3IoU1ZF
X1ZMX01BWF9CSVRTKTsNCj4+Pj4+ICsgICAgdW5zaWduZWQgaW50IGh3X3ZsOw0KPj4+Pj4gKw0K
Pj4+Pj4gKyAgICAvKiBSZW1vdmUgdHJhcCBmb3IgU1ZFIHJlc291cmNlcyAqLw0KPj4+Pj4gKyAg
ICBXUklURV9TWVNSRUcoY3B0cl9iaXRzICYgfkhDUFRSX0NQKDgpLCBDUFRSX0VMMik7DQo+Pj4+
PiArICAgIGlzYigpOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAvKg0KPj4+Pj4gKyAgICAgKiBTZXQg
dGhlIG1heGltdW0gU1ZFIHZlY3RvciBsZW5ndGgsIGRvaW5nIHRoYXQgd2Ugd2lsbCBrbm93IHRo
ZSBWTA0KPj4+Pj4gKyAgICAgKiBzdXBwb3J0ZWQgYnkgdGhlIHBsYXRmb3JtLCBjYWxsaW5nIHN2
ZV9nZXRfaHdfdmwoKQ0KPj4+Pj4gKyAgICAgKi8NCj4+Pj4+ICsgICAgV1JJVEVfU1lTUkVHKHpj
ciwgWkNSX0VMMik7DQo+Pj4+IA0KPj4+PiBGcm9tIG15IHJlYWRpbmcgb2YgdGhlIEFybSAoRDE5
LTYzMzEsIEFSTSBEREkgMDQ4N0ouYSksIGEgZGlyZWN0IHdyaXRlIHRvIGEgc3lzdGVtIHJlZ2lz
dGVyIHdvdWxkIG5lZWQgdG8gYmUgZm9sbG93ZWQgYnkgYW4gY29udGV4dCBzeW5jaHJvbml6YXRp
b24gZXZlbnQgKGUuZy4gaXNiKCkpIGJlZm9yZSB0aGUgc29mdHdhcmUgY2FuIHJlbHkgb24gdGhl
IHZhbHVlLg0KPj4+PiANCj4+Pj4gSW4gdGhpcyBzaXR1YXRpb24sIEFGQUlDVCwgdGhlIGluc3Ry
dWNpdG9uIGluIHN2ZV9nZXRfaHdfdmwoKSB3aWxsIHVzZSB0aGUgY29udGVudCBvZiBaQ1JfRUwy
LiBTbyBkb24ndCB3ZSBuZWVkIGFuIElTQigpIGhlcmU/DQo+Pj4gDQo+Pj4gRnJvbSB3aGF0IEni
gJl2ZSByZWFkIGluIHRoZSBtYW51YWwgZm9yIFpDUl9FTHg6DQo+Pj4gDQo+Pj4gQW4gaW5kaXJl
Y3QgcmVhZCBvZiBaQ1JfRUwyLkxFTiBhcHBlYXJzIHRvIG9jY3VyIGluIHByb2dyYW0gb3JkZXIg
cmVsYXRpdmUgdG8gYSBkaXJlY3Qgd3JpdGUgb2YNCj4+PiB0aGUgc2FtZSByZWdpc3Rlciwgd2l0
aG91dCB0aGUgbmVlZCBmb3IgZXhwbGljaXQgc3luY2hyb25pemF0aW9uDQo+Pj4gDQo+Pj4gSeKA
mXZlIGludGVycHJldGVkIGl0IGFzIOKAnHRoZXJlIGlzIG5vIG5lZWQgdG8gc3luYyBiZWZvcmUg
d3JpdGXigJ0gYW5kIEnigJl2ZSBsb29rZWQgaW50byBMaW51eCBhbmQgaXQgZG9lcyBub3QNCj4+
PiBBcHBlYXIgYW55IHN5bmNocm9uaXNhdGlvbiBtZWNoYW5pc20gYWZ0ZXIgYSB3cml0ZSB0byB0
aGF0IHJlZ2lzdGVyLCBidXQgaWYgSSBhbSB3cm9uZyBJIGNhbiBmb3Igc3VyZQ0KPj4+IGFkZCBh
biBpc2IgaWYgeW91IHByZWZlci4NCj4+IA0KPj4gQWgsIEkgd2FzIHJlYWRpbmcgdGhlIGdlbmVy
aWMgc2VjdGlvbiBhYm91dCBzeW5jaHJvbml6YXRpb24gYW5kIGRpZG4ndCANCj4+IHJlYWxpemUg
dGhlcmUgd2FzIGEgcGFyYWdyYXBoIGluIHRoZSBaQ1JfRUwyIHNlY3Rpb24gYXMgd2VsbC4NCj4+
IA0KPj4gUmVhZGluZyB0aGUgbmV3IHNlY3Rpb24sIEkgYWdyZWUgd2l0aCB5b3VyIHVuZGVyc3Rh
bmRpbmcuIFRoZSBpc2IoKSBpcyANCj4+IG5vdCBuZWNlc3NhcnkuDQo+IA0KPiBBbmQgUkRWTCBj
b3VudHMgYXMgYW4gImluZGlyZWN0IHJlYWQiPyBJJ20gcHJldHR5IHN1cmUgIm5vcm1hbCIgU1ZF
IGluc24NCj4gdXNlIGlzIGZhbGxpbmcgaW4gdGhhdCBjYXRlZ29yeSwgYnV0IFJEVkwgbWlnaHQg
YWxzbyBiZSB2aWV3ZWQgYXMgbW9yZQ0KPiBzaW1pbGFyIHRvIE1SUyBpbiB0aGlzIHJlZ2FyZD8g
V2hpbGUgdGhlIGNvbnN0cnVjdCBDdXJyZW50VkwgaXMgdXNlZCBpbg0KPiBlaXRoZXIgY2FzZSwg
SSdtIHN0aWxsIG5vdCBzdXJlIHRoaXMgZ29lcyB3aXRob3V0IHNheWluZy4NCg0KSGkgSmFuLA0K
DQpMb29raW5nIGludG8gdGhlIExpbnV4IGNvZGUsIGluIGZ1bmN0aW9uIHZlY19wcm9iZV92cXMo
Li4uKSBpbiBhcmNoL2FybTY0L2tlcm5lbC9mcHNpbWQuYywNClpDUl9FTDEgaXMgd3JpdHRlbiwg
d2l0aG91dCBzeW5jaHJvbmlzYXRpb24sIGFuZCBhZnRlcndhcmRzIFJEVkwgaXMgdXNlZC4NCg0K
SSB0aGluayBaQ1JfRUwyIGhhcyB0aGUgc2FtZSBiZWhhdmlvdXIuDQoNCkNoZWVycywNCkx1Y2EN
Cg0KPiANCj4gSmFuDQoNCg==

