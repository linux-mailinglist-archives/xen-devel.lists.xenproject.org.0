Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CC56E94CB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 14:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524261.815061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTdj-00080W-HB; Thu, 20 Apr 2023 12:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524261.815061; Thu, 20 Apr 2023 12:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTdj-0007xj-DD; Thu, 20 Apr 2023 12:43:55 +0000
Received: by outflank-mailman (input) for mailman id 524261;
 Thu, 20 Apr 2023 12:43:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9VJI=AL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ppTdh-0007xd-Cm
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 12:43:53 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffa87937-df78-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 14:43:50 +0200 (CEST)
Received: from AS9PR06CA0189.eurprd06.prod.outlook.com (2603:10a6:20b:45d::7)
 by PAWPR08MB9830.eurprd08.prod.outlook.com (2603:10a6:102:2e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 12:43:47 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::34) by AS9PR06CA0189.outlook.office365.com
 (2603:10a6:20b:45d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.24 via Frontend
 Transport; Thu, 20 Apr 2023 12:43:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.23 via Frontend Transport; Thu, 20 Apr 2023 12:43:47 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Thu, 20 Apr 2023 12:43:46 +0000
Received: from 3d1dc7003da4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 55E81245-8C00-44B3-9743-7DA7EE059D98.1; 
 Thu, 20 Apr 2023 12:43:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d1dc7003da4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Apr 2023 12:43:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB8815.eurprd08.prod.outlook.com (2603:10a6:102:337::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 12:43:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 12:43:36 +0000
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
X-Inumbo-ID: ffa87937-df78-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eebYkdrr6m6foLMENZbrTRxHua8J/TVczgQQV+fkLWc=;
 b=nougqb9w1OX6VC7vVDDfxhi/cn5npEdjJytUTqxJbbimYOQ6POhA+r4ckBAOTUZIV1vs9ewuL0NTz1EWppKm52crx92D20/huj/AsjgpgdQ/M4Ax/7VAN/VlIZAHfS7lvl+LxhhjLPppy+2qD9nH/lG97TUeEgGc03jdh0UfqMk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ee8c370bf54f063
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyOFv/9yyXyc0RNZ99UMkwD807WdCD903dvy/TKboPoqgJIg+OQWTgTT3MY1fL1/TI1KIRGrWaHGOIubKKI4gWzYqjzVw6AZOWlXfX3HZZEXpprU9bMlCEZ7wnOUU7eHD9rA82ibaHzLDMO2srC4amP5PaD8q6i9Fs31yHE3Y3nUNbRmWaeyG3WE/rYRd8QTVJAXocPaBN9Gd4+EuxPnZdDC23yAPXW8qxdj4/1SdqOVtex7jbnV7UvECMHYwE0ZpudVTXY9iHnQBNAPDmPznRUZgxJzuAwafVezF3L/0gacUPQ7/0QwUIUEVztCitwxj6ktTW1OMZlq063aEdJewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eebYkdrr6m6foLMENZbrTRxHua8J/TVczgQQV+fkLWc=;
 b=BkOQnc48B8air+q50YhyRBQoWXcjcC4iJdsMNlAnkC4yn7TS35ecL3IMucsXnWQm9BZ3h+VwxUbdL4aFkZsgT0gJeotlav9KRfQlbfByN59pBdKiwtAPTFMG4kXc5VVfa+2MmlZlm5xwvj0m/J+Sq/Z5j4Lym8tld76QrvXYYlqhhZjxGu/OMPGd8gkoPjm2qb6IcYFaky5os7Vsbtg+/8yCA7oJkpROzIy3EAB9JAWwYv6OMmK1JLsc9VfTBqBDs1K9E1oGIaAS7eoUPtuoGeLxIkcLFNYKhKzFNjQWJWiGgn7uZgFMzQhzXOMq9wlGaKFZft0K7f73JHBKQ7T1fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eebYkdrr6m6foLMENZbrTRxHua8J/TVczgQQV+fkLWc=;
 b=nougqb9w1OX6VC7vVDDfxhi/cn5npEdjJytUTqxJbbimYOQ6POhA+r4ckBAOTUZIV1vs9ewuL0NTz1EWppKm52crx92D20/huj/AsjgpgdQ/M4Ax/7VAN/VlIZAHfS7lvl+LxhhjLPppy+2qD9nH/lG97TUeEgGc03jdh0UfqMk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Index:
 AQHZbSQ+XccnxtxNG0WbEgpX88e2za8xDZ2AgAE1hQCAAAGYAIAABb6AgAGkXICAAD5kgIAAA+SA
Date: Thu, 20 Apr 2023 12:43:36 +0000
Message-ID: <BE516382-0E45-4D6E-8012-1D75C1F13680@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
 <F30CEF99-693A-4218-AC80-433A183DE866@arm.com>
 <3DE2B914-FA6E-49EF-8748-BB8DE4B2CC11@arm.com>
 <8DA3FECA-DEBD-479E-9E5A-57676B98ADA4@arm.com>
 <DE00F3DB-C6D9-4D90-97A8-FD964FD03099@arm.com>
 <bb6b5288-f123-8d25-3cc3-ef36164ea04c@xen.org>
In-Reply-To: <bb6b5288-f123-8d25-3cc3-ef36164ea04c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB8815:EE_|AM7EUR03FT058:EE_|PAWPR08MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a68c21-5ae7-4050-8bc4-08db419ce275
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1T/IhAc4Qmonzb8TePV0wWKrdfIyt/pjJUpwOp1+InwImu/6te45K5sgB1mbW3DfOpacE9FzWoBslxIsD1+nSxGe7pjustzEx3KA64queLi/whlYzEqLeANC7zPOFBq3nJuDcRsxTNFzElT/4HRIG6+Bpe5p6c1j1TVSjfDsTqZ9XCLLa9uKDJYs6Cachk3CWjKS8EIpgNyVbWAEi0n2FHbAsjW7sAfGfxtrDY0Qq6My9paUg62AvDCOdSi8IvBilft3MbjOtejCVgER8v07C9GXOCGQYaNvOi4rXSiuE937xYfysTqj0CGSrPDQdI3jlpW27hPvBHhM57bqmQ38y/H4IWr+zP8kLn49wYKwJU272qUeL7qSep0W9WM3k8S6JUUBWhFqz2TbkAz9mv9B5ISuopfV9ifSSNP9YAGxb+QpknsdqEY69sTMKeOD3TtGpZtr0lmWzc2GW863uwQQ136JEu+j1yzPvcfzFFfW2Dfyd8UzKKxrhVgqYORo2WgL8vEdwMGpFJmTSc3bJ7luBHGjlenHsSVdvUMqVuGSHHyQBQX23cGI7q+f0CJzgOtzdzjBPPAn8d5jyp9PStNFpXV+Gc6UTOeEUw6O+Jd/2JZa8bMUAYIgBIWl4GRQuJhksEDl4svn7om6Eutn69uguQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(2906002)(38070700005)(86362001)(83380400001)(5660300002)(2616005)(36756003)(186003)(33656002)(6506007)(26005)(53546011)(8676002)(6512007)(8936002)(38100700002)(122000001)(316002)(71200400001)(6486002)(41300700001)(91956017)(76116006)(64756008)(66446008)(66556008)(66946007)(6916009)(478600001)(4326008)(66476007)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BED82742EB7EB42AAB082F60816584C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8815
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	113037c3-acd5-4ed7-7440-08db419cdbdb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kkgyFiL3EuJAurHYCaQGcCGw+3E2QXBuc1cTpxcQXIVPDaI0jaDObRTSOInaYsJeGRU80K6ep5+ysdm8WWEFWlFcUzBn1YytQvNiV8ax5TJcV1aldf3nsp5P0TQq2oWhMJbKEpO65HdsbiBR/UCBNST8zh0LFXlKnE5HQzHeeGUcVvtpWrd4JhUJz5uX6uFJgRYpLc5/tCZ8lxgtw+oPuxh9jvj0elJFol1Riy9Fb/WlKHNyKI+uPXVMqM9rsgtRKLPN8QrSGAhuGdzXg5CyISAM7UpQS/NsJQSEl0/BQOM1ZJBPdSMfz9HAJrGbfFZ4uAcLlcFXhkL65qdYmqv6PO8YDhJxPD6w/FIZEau5PCd9ExlCeLBz+IXyAExn3b6+tvKFpQyEdUJvXca9x+aaph5eUagClazvQ3rgrFhlD9ul8kxVKZU5CIXvsdkxfk5Vh+CvNGVvOpeXA3AFGpGY6ZxjDN9Zf5C/A0H1nwKX0zioNiq1InFmDSjKasHkQrV6cV60H8ZhkQgjwCpJVbb3mM33MVC8x6xBBrr2HApix3GOc3xmeupCHZGvo5yDsxFONC0FUryRfxRCTlbyigikJqve2KYKLAGgkVdJJqBXN+p/HnPl6f67ekMNE58gBRyfC1+qI8oQ1YQXIbdrpqGhE4Xv8DQzxm9y+6XOGlqIrJreE34bDGq/I9B5aePRmWNkYbf5y8tUTl0VqCDX67MMCw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(54906003)(83380400001)(47076005)(478600001)(2616005)(36860700001)(40480700001)(86362001)(6486002)(6506007)(6512007)(26005)(53546011)(107886003)(4326008)(316002)(70206006)(70586007)(82740400003)(186003)(336012)(6862004)(8676002)(8936002)(2906002)(81166007)(356005)(41300700001)(5660300002)(40460700003)(33656002)(36756003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 12:43:47.2333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a68c21-5ae7-4050-8bc4-08db419ce275
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9830

DQoNCj4gT24gMjAgQXByIDIwMjMsIGF0IDEzOjI5LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyMC8wNC8yMDIzIDA5OjQ2LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+PiAraW50IF9faW5pdCBzdmVfc2FuaXRpemVfdmxf
cGFyYW0oaW50IHZhbCwgdW5zaWduZWQgaW50ICpvdXQpDQo+Pj4+Pj4+ICt7DQo+Pj4+Pj4+ICsg
ICAgLyoNCj4+Pj4+Pj4gKyAgICAgKiBOZWdhdGl2ZSBTVkUgcGFyYW1ldGVyIHZhbHVlIG1lYW5z
IHRvIHVzZSB0aGUgbWF4aW11bSBzdXBwb3J0ZWQNCj4+Pj4+Pj4gKyAgICAgKiB2ZWN0b3IgbGVu
Z3RoLCBvdGhlcndpc2UgaWYgYSBwb3NpdGl2ZSB2YWx1ZSBpcyBwcm92aWRlZCwgY2hlY2sgaWYg
dGhlDQo+Pj4+Pj4+ICsgICAgICogdmVjdG9yIGxlbmd0aCBpcyBhIG11bHRpcGxlIG9mIDEyOCBh
bmQgbm90IGJpZ2dlciB0aGFuIHRoZSBtYXhpbXVtIHZhbHVlDQo+Pj4+Pj4+ICsgICAgICogMjA0
OA0KPj4+Pj4+PiArICAgICAqLw0KPj4+Pj4+PiArICAgIGlmICggdmFsIDwgMCApDQo+Pj4+Pj4+
ICsgICAgICAgICpvdXQgPSBnZXRfc3lzX3ZsX2xlbigpOw0KPj4+Pj4+PiArICAgIGVsc2UgaWYg
KCAoKHZhbCAlIFNWRV9WTF9NVUxUSVBMRV9WQUwpID09IDApICYmICh2YWwgPD0gU1ZFX1ZMX01B
WF9CSVRTKSApDQo+Pj4+Pj4+ICsgICAgICAgICpvdXQgPSB2YWw7DQo+Pj4+Pj4gDQo+Pj4+Pj4g
U2hvdWxkbid0IHlvdSBhbHNvIGNoZWNrIGlmIGl0IGlzIG5vdCBncmVhdGVyIHRoYW4gdGhlIG1h
eGltdW0gdmVjdG9yIGxlbmd0aCA/DQo+Pj4+PiANCj4+Pj4+IEkgZG9u4oCZdCB1bmRlcnN0YW5k
LCBJIGFtIGNoZWNraW5nIHRoYXQgdGhlIHZhbHVlIGlzIGJlbG93IG9yIGVxdWFsIHRvIFNWRV9W
TF9NQVhfQklUUywNCj4+Pj4+IElmIHlvdSBtZWFuIGlmIGl0IHNob3VsZCBiZSBjaGVja2VkIGFs
c28gYWdhaW5zdCB0aGUgbWF4aW11bSBzdXBwb3J0ZWQgbGVuZ3RoIGJ5IHRoZSBwbGF0Zm9ybSwN
Cj4+Pj4+IEkgdGhpbmsgdGhpcyBpcyBub3QgdGhlIHJpZ2h0IHBsYWNlLCB0aGUgY2hlY2sgaXMg
YWxyZWFkeSBpbiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoKSwgaW50cm9kdWNlZA0KPj4+
Pj4gaW4gcGF0Y2ggIzINCj4+Pj4gDQo+Pj4+IElmIHRoaXMgaXMgbm90IHRoZSByaWdodCBwbGFj
ZSB0byBjaGVjayBpdCB0aGVuIHdoeSBjaGVja2luZyB0aGUgcmVzdCBoZXJlID8NCj4+Pj4gDQo+
Pj4+IEZyb20gYSB1c2VyIG9yIGEgZGV2ZWxvcGVyIHBvaW50IG9mIHZpZXcgSSB3b3VsZCBleHBl
Y3QgdGhlIHZhbGlkaXR5IG9mIHRoZSBpbnB1dCB0byBiZSBjaGVja2VkIG9ubHkNCj4+Pj4gaW4g
b25lIHBsYWNlLg0KPj4+PiBJZiBoZXJlIGlzIG5vdCB0aGUgcGxhY2UgZm9yIHRoYXQgaXQgaXMg
b2sgYnV0IHRoZW4gaSB3b3VsZCBjaGVjayBldmVyeXRoaW5nIGluIGFyY2hfc2FuaXRpc2VfZG9t
YWluX2NvbmZpZw0KPj4+PiAobXVsdGlwbGUsIG1pbiBhbmQgc3VwcG9ydGVkKSBpbnN0ZWFkIG9m
IGRvaW5nIGl0IHBhcnRseSBpbiAyIHBsYWNlcy4NCj4+PiANCj4+PiBPaywgZ2l2ZW4gdGhlIHdh
eSB3ZSBlbmNvZGVkIHRoZSB2YWx1ZSBpbiB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBzdHJ1Y3R1
cmUsIHdlIGhhdmUgdGhhdCB0aGUgdmFsdWUgdGFrZXMNCj4+PiB2ZXJ5IGxpdHRsZSBzcGFjZSwg
YnV0IGEgc21hbGwgaXNzdWUgaXMgdGhhdCB3aGVuIHdlIGVuY29kZSBpdCwgd2UgYXJlIGRpdmlk
aW5nIGl0IGJ5IDEyOCwgd2hpY2ggaXMgZmluZSBmb3IgdXNlciBwYXJhbXMNCj4+PiB0aGF0IGFy
ZSBtdWx0aXBsZSBvZiAxMjgsIGJ1dCBpdOKAmXMgbGVzcyBmaW5lIGlmIHRoZSB1c2VyIHBhc3Nl
cyDigJwxMjnigJ0uDQo+Pj4gDQo+Pj4gVG8gb3ZlcmNvbWUgdGhpcyBpc3N1ZSB3ZSBhcmUgY2hl
Y2tpbmcgdGhlIHZhbHVlIHdoZW4gaXQgaXMgbm90IGFscmVhZHkgZW5jb2RlZC4gTm93LCB0aGlu
a2luZyBhYm91dCBpdCwgdGhlIGNoZWNrDQo+Pj4gIiYmICh2YWwgPD0gU1ZFX1ZMX01BWF9CSVRT
KeKAnSBpcyBub3QgcmVhbGx5IG5lZWRlZCwgYmVjYXVzZSBldmVuIGlmIHRoZSB2YWx1ZSBpcyBh
Ym92ZSwgdGhlbiBpbiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcNCj4+PiB3ZSB3aWxsIGhp
dCB0aGUgdG9wIGxpbWl0IG9mIHRoZSBwbGF0Zm9ybSBtYXhpbXVtIFZMLg0KPj4+IA0KPj4+IGlu
dCBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9t
YWluICpjb25maWcpDQo+Pj4gew0KPj4+ICAgIHVuc2lnbmVkIGludCBtYXhfdmNwdXM7DQo+Pj4g
ICAgdW5zaWduZWQgaW50IGZsYWdzX3JlcXVpcmVkID0gKFhFTl9ET01DVExfQ0RGX2h2bSB8IFhF
Tl9ET01DVExfQ0RGX2hhcCk7DQo+Pj4gICAgdW5zaWduZWQgaW50IGZsYWdzX29wdGlvbmFsID0g
KFhFTl9ET01DVExfQ0RGX2lvbW11IHwgWEVOX0RPTUNUTF9DREZfdnBtdSk7DQo+Pj4gICAgdW5z
aWduZWQgaW50IHN2ZV92bF9iaXRzID0gc3ZlX2RlY29kZV92bChjb25maWctPmFyY2guc3ZlX3Zs
KTsNCj4+PiANCj4+PiAgICBpZiAoIChjb25maWctPmZsYWdzICYgfmZsYWdzX29wdGlvbmFsKSAh
PSBmbGFnc19yZXF1aXJlZCApDQo+Pj4gICAgew0KPj4+ICAgICAgICBkcHJpbnRrKFhFTkxPR19J
TkZPLCAiVW5zdXBwb3J0ZWQgY29uZmlndXJhdGlvbiAlI3hcbiIsDQo+Pj4gICAgICAgICAgICAg
ICAgY29uZmlnLT5mbGFncyk7DQo+Pj4gICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+ICAgIH0N
Cj4+PiANCj4+PiAgICAvKiBDaGVjayBmZWF0dXJlIGZsYWdzICovDQo+Pj4gICAgaWYgKCBzdmVf
dmxfYml0cyA+IDAgKQ0KPj4+ICAgIHsNCj4+PiAgICAgICAgdW5zaWduZWQgaW50IHpjcl9tYXhf
Yml0cyA9IGdldF9zeXNfdmxfbGVuKCk7DQo+Pj4gDQo+Pj4gICAgICAgIGlmICggIXpjcl9tYXhf
Yml0cyApDQo+Pj4gICAgICAgIHsNCj4+PiAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8s
ICJTVkUgaXMgdW5zdXBwb3J0ZWQgb24gdGhpcyBtYWNoaW5lLlxuIik7DQo+Pj4gICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4+PiAgICAgICAgfQ0KPj4+IA0KPj4+ICAgICAgICBpZiAoIHN2
ZV92bF9iaXRzID4gemNyX21heF9iaXRzICkNCj4+PiAgICAgICAgew0KPj4+ICAgICAgICAgICAg
ZHByaW50ayhYRU5MT0dfSU5GTywNCj4+PiAgICAgICAgICAgICAgICAgICAgIlJlcXVlc3RlZCBT
VkUgdmVjdG9yIGxlbmd0aCAoJXUpID4gc3VwcG9ydGVkIGxlbmd0aCAoJXUpXG4iLA0KPj4+ICAg
ICAgICAgICAgICAgICAgICBzdmVfdmxfYml0cywgemNyX21heF9iaXRzKTsNCj4+PiAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPj4+ICAgICAgICB9DQo+Pj4gICAgfQ0KPj4+ICAgWy4uLl0N
Cj4+PiANCj4+PiBOb3csIEkgdW5kZXJzdGFuZCB5b3VyIHBvaW50LCB3ZSBjb3VsZCBjaGVjayBl
dmVyeXRoaW5nIGluIHN2ZV9zYW5pdGl6ZV92bF9wYXJhbSgpLCBidXQgaXQgd291bGQgbGVhdmUg
YSBwcm9ibGVtDQo+Pj4gZm9yIGRvbWFpbnMgY3JlYXRlZCBieSBoeXBlcmNhbGxzIGlmIEkgYW0g
bm90IHdyb25nLg0KPj4+IA0KPj4+IFdoYXQgZG8geW91IHRoaW5rPw0KPj4gSSB0aG91Z2h0IGFi
b3V0IHRoYXQgYW5kIGFub3RoZXIgcG9zc2liaWxpdHkgaXMgdG8gc3RvcmUg4oCcc3ZlX3Zs4oCd
IGFzIHVpbnQxNl90IGluc2lkZSBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnLCBhbmQNCj4+
IGNoZWNrIGl0IGluc2lkZSBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoKSBmb3IgaXQgdG8g
YmUgbW9kIDEyOCBhbmQgbGVzcyB0aGFuIHRoZSBtYXggc3VwcG9ydGVkIFZMLCB0aGlzIHdpbGwN
Cj4+IGFsbG93IHRvIGhhdmUgYWxsIHRoZSBjaGVja3MgaW4gb25lIHBsYWNlLCB0YWtpbmcgYSBi
aXQgbW9yZSBzcGFjZSwgYW55d2F5IHdlIHdvdWxkIHRha2UgdGhlIHNwYWNlIGZyb20gdGhlIGlt
cGxpY2l0DQo+PiBwYWRkaW5nIGFzIHRoaXMgaXMgdGhlIGN1cnJlbnQgc3RhdHVzOg0KDQpIaSBK
dWxpZW4sDQoNCj4gDQo+IFNvcnJ5LCBJIGFtIGhhdmluZyB0cm91YmxlIHRvIGZvbGxvdyB0aGUg
ZGlzY3Vzc2lvbi4gSWYgeW91IGFyZSBjaGVja2luZyB0aGUgdmFsdWUgaW4gYXJjaF9zYW5pdGlz
ZV9kb21haW5fY29uZmlnKCksIHRoZW4gd2h5IGRvIHlvdSBuZWVkIHRvIHRha2UgbW9yZSBzcGFj
ZSBpbiBhcmNoX2RvbWFpbj8NCg0KWWVzIEkgYW0gY2hlY2tpbmcgdGhlIHZhbHVlIGluIGFyY2hf
c2FuaXRpc2VfZG9tYWluX2NvbmZpZywgdGhlIHZhbHVlIGNoZWNrZWQgaXMgZnJvbSBhcmNoX2Rv
bWFpbiBhbmQgaXQgaXMgdGhlIHZlY3RvciBsZW5ndGggZGl2aWRlZCBieSAxMjgsIHNvIGFuIGVu
Y29kZWQgdmFsdWUuDQoNCkJlcnRyYW5kIHdhcyBwdXp6bGVkIGJ5IHRoZSBmYWN0IHRoYXQgSSBh
bHNvIHB1dCBhIGNoZWNrIGluIHN2ZV9zYW5pdGl6ZV92bF9wYXJhbSB0byBzZWUgaWYgdGhlIHZl
Y3RvciBsZW5ndGggcGFzc2VkIGJ5IHRoZSB1c2VyIGlzIG1vZCAxMjgsIGhpcyBwb2ludCBpcyB0
aGF0IHdlIHNob3VsZCBjaGVjayBhIHZhbHVlIG9ubHkgaW4gb25lIHBsYWNlIGFuZCBub3QgaW4g
dHdvLCBhbmQgaXQgaXMgYSB2YWxpZCBwb2ludCBidXQgaW4gdGhpcyBjYXNlIHdlIGNhbuKAmXQg
cHV0IGFsbCB0aGUgY2hlY2sgaW50byBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcgYmVjYXVz
ZSB3ZSBkb27igJl0IGhhdmUgdGhlIOKAnGZ1bGzigJ0gdmFsdWUgZnJvbSBhcmNoX2RvbWFpbiwg
YW5kIHdlIGNhbuKAmXQgcHV0IGFsbCB0aGUgY2hlY2tzIGluIHN2ZV9zYW5pdGl6ZV92bF9wYXJh
bSBiZWNhdXNlIGl0IHdpbGwgbGVhdmUgb3V0IGZyb20gdGhlIGNoZWNrIGRvbWFpbnMgY3JlYXRl
ZCBieSBoeXBlciBjYWxscy4NCg0KU28gdG8gaGF2ZSBvbmx5IG9uZSBwb2ludCB3aGVyZSB0aGUg
Y2hlY2tzIGFyZSBkb25lIChtb2QgMTI4IGFuZCA8PSBIVyBzdXBwb3J0ZWQgVkwpLCB3ZSBtaWdo
dCBuZWVkIHRvIGhhdmUgYSBmdWxsIHJlc29sdXRpb24gVkwgdmFsdWUgaW4gc3RydWN0IHhlbl9h
cmNoX2RvbWFpbmNvbmZpZyAoMTYgYml0KS4NCg0KQnV0IGlmIHdlIHdhbnQgdG8gc2F2ZSBzcGFj
ZSBmb3IgdGhlIGZ1dHVyZSwgd2UgY291bGQgbGVhdmUgdGhlIGNvZGUgYXMgaXQgaXMgYW5kIHJl
bHkgb24gdGhlIGZhY3QgdGhhdCB0aGUgdG9vbHMgKG9yIFhlbikgd2hlbiBjcmVhdGluZyB0aGUg
ZG9tYWluIGNvbmZpZ3VyYXRpb24sIHdpbGwgY2hlY2sgdGhhdCB0aGUgU1ZFIFZMIHBhcmFtZXRl
ciBpcyBtb2QgMTI4Lg0KSW4gdGhpcyBsYXN0IGNhc2Ugd2hhdCBpcyBpbiBzdHJ1Y3QgeGVuX2Fy
Y2hfZG9tYWluY29uZmlnIGlzIGltcGxpY2l0bHkgbW9kIDEyOCBhbmQgb25seSB0aGUgdXBwZXIg
Ym91bmRhcnkgb2YgdGhlIG1heCBzdXBwb3J0ZWQgVkwgd2lsbCBiZSBjaGVja2VkIGJ5IFhlbiBp
bnNpZGUgYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnLg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0K
PiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg0K

